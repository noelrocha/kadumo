require 'fastercsv'

class FileImporterWorker

  include BackgroundFu::WorkerMonitoring
  
  def import_subscribers(imported_file_id)
    imported_file = ImportedFile.find(imported_file_id)
    return if imported_file.nil?
    filename = imported_file.public_filename
    imported_file.status = 1
    imported_file.save
    begin
      total_lines = File.open(filename,"r").readlines.size 
      imported_lines = 0
      record_progress(0)
      FasterCSV.foreach(filename) do |row|
        username, domain_name, password, email_address, first_name, last_name = row
        subscriber = Subscriber.find(:first, :conditions => {:username => username, :domain => domain_name})
      
        if subscriber.nil? then
          domain = Domain.find_or_create_by_name(:name => domain_name)
          subscriber = Subscriber.new(:username => username, :domain => domain)
        end
      
        subscriber.password = password
        subscriber.email_address = email_address
        subscriber.first_name = first_name
        subscriber.last_name = last_name
        #subscriber.rpid = rpid
      
        subscriber.save
        imported_lines += 1
        record_progress((imported_lines.to_f/total_lines.to_f)*100)
      end    
      imported_file.status = 2
      imported_file.save
    rescue
      imported_file.status = 3
      imported_file.save
    end
  end
  
  def import_db_aliases(imported_file_id)
    imported_file = ImportedFile.find(imported_file_id)
    return if imported_file.nil?
    filename = imported_file.public_filename
    imported_file.status = 1
    imported_file.save
    begin
      total_lines = File.open(filename,"r").readlines.size 
      imported_lines = 0
      record_progress(0)
      FasterCSV.foreach(filename) do |row|
        alias_username, alias_domain, username, domain_name = row
      
        dbalias = DbAlias.find(:first, :conditions => {:alias_username => alias_username, :alias_domain => alias_domain})
      
        if dbalias.nil? then
          dbalias = DbAlias.new(:alias_username => alias_username, :alias_domain => alias_domain)   
        end
      
        domain = Domain.find_or_create_by_name(:name => domain_name)
        dbalias.username = username
        dbalias.domain = domain
      
        dbalias.save
        imported_lines += 1
        record_progress((imported_lines.to_f/total_lines.to_f)*100)
      end
    
      imported_file.status = 2
      imported_file.save    
    rescue
      imported_file.status = 3
      imported_file.save
    end
  end
end