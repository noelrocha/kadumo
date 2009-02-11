module Job::BonusFeatures
  
  def self.included(base)
    base.states += %w(stopping stopped)
    base.generate_state_helpers

    base.alias_method_chain :invoke_worker, :threads
    base.alias_method_chain :ensure_worker, :threads
    base.alias_method_chain :restart!,      :threads
  end
  
  def invoke_worker_with_threads
    monitor_worker
    
    res = catch(:stopping) do
      invoke_worker_without_threads; nil
    end
    
    self.reload
    self.state = res ? "stopped" : "finished"
  end

  def ensure_worker_with_threads
    ensure_worker_without_threads
    cleanup_after_threads
  end
  
  # The record_progress() method becomes available when your worker class includes
  # Background::WorkerMonitoring.
  #
  # Every time worker invokes record_progress() is a possible stopping place.
  #
  # How it works:
  # 1. invoke job.stop! to set a state (stopping) in a db
  # 2. Monitoring thread picks up the state change from db
  #    and sets @stopping to true in the worker.
  # 3. The worker invokes a register_progress() somewhere during execution.
  # 4. The record_progress() method throws :stopping symbol if @stopping == true
  # 5. The job catches the :stopping symbol and reacts upon it.
  # 6. The job is stopped in a merciful way. No one gets harmed.
  def stop!
    if running?
      update_attribute(:state, "stopping")
      logger.info("BackgroundFu: Stopping job. Job(id: #{id}).")
    end
  end
  
  # Overridden because of new "stopped" state.
  def restart_with_threads!
    if stopped? || failed?
      update_attributes!(
        :result     => nil, 
        :progress   => nil, 
        :started_at => nil, 
        :state      => "pending"
      ) 
      logger.info("BackgroundFu: Restarting job. Job(id: #{id}).")
    end
  end

  # Monitors the worker and updates the job progress.  If the job's status
  # is changed to 'stopping', the worker is requested to stop.
  def monitor_worker
    Thread.new do
      while running? && !Job.find(id).stopping?
        current_progress = @worker.instance_variable_get("@progress")

        if current_progress == progress
          sleep 5
        else
          update_attribute(:progress, current_progress)
          sleep 1
        end
      end

      if Job.find(id).stopping?
        @worker.instance_variable_set("@stopping", true)
      end
    end
    
    logger.info("BackgroundFu: Job monitoring started. Job(id: #{id}).")
  end

  # Closes database connections left after finished threads.
  def cleanup_after_threads
    ActiveRecord::Base.verify_active_connections!
  end
  
  def elapsed
    (updated_at.to_f - started_at.to_f).to_i if !pending?
  end
  
  # seconds to go, based on estimated and progress
  def estimated
    ((elapsed * 100) / progress) - elapsed if running? && (1..99).include?(progress.to_i)
  end

end
