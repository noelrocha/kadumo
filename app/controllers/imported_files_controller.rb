class ImportedFilesController < ApplicationController

  active_scaffold :imported_file do |config|
    config.label = "Uploaded files"
    config.create.multipart = true
    config.actions.exclude :update    
    config.columns = [:uploaded_data, :file_type]
    config.list.columns = [:filename, :file_type, :status]

    config.columns[:file_type].form_ui = :select
    config.columns[:file_type].options = {'Subscribers' => 1, 'DB Aliases' => 2}    

    config.action_links.add 'import_file', :label => 'Process this file', :type => :record, 
                                           :page => true, :confirm => 'Are you sure that you want to process this file?'

    config.create.link.label = 'Upload new'
    config.create.label = 'Upload new file'
  end
  
  def import_file
    imported_file = ImportedFile.find(params[:id])
    
    if imported_file != nil then
      if imported_file.file_type == 1 then
        Job.enqueue!(FileImporterWorker, :import_subscribers, imported_file.id)
      else
        if imported_file.file_type == 2 then
          Job.enqueue!(FileImporterWorker, :import_db_aliases, imported_file.id)
        end
      end
#      flash[:notice] = "Import process started successfully"
    else
#      flash[:notice] = "There is no file to import"
    end
    
    redirect_to :action => 'index'
  end

end
