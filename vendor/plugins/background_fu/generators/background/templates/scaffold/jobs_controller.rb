class Admin::JobsController < Admin::ApplicationController

  def index
    @jobs = Job.find(:all, :order => "id desc")
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.text do 
        if @job.result.respond_to?(:join)
          send_data @job.result.join("\n"), :type => "text/plain", :disposition => "attachment"
        else
          render :nothing => true, :status => 404
        end
      end
      format.js do
        render :update do |page|
          page[@job].replace_html :partial => "job"
        end
      end
    end
  end
  
  def create
    params[:job][:args] = params[:job][:args].split("\n").map(&:strip)
    @job = Job.new(params[:job])
    
    if @job.save
      redirect_to admin_jobs_path
    else
      render :action => "new"
    end
  end

  def update
    @job = Job.find(params[:id])
    
    if params[:command] == "stop"
      @job.stop!
    elsif params[:command] == "restart" 
      @job.restart!
    end

    render :update do |page|
      page[@job].replace_html :partial => "job"
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    render :update do |page|
      page[@job].replace_html :partial => "job_deleted", :object => @job
    end
  end

end
