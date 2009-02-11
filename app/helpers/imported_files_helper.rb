module ImportedFilesHelper
  FILE_TYPE = {1 => 'Subscribers', 2 => 'DB Aliases'}
  STATUS = {0 => 'Uploaded', 1 => 'Processing', 2 => 'Processed', 3 => 'Error processing'}
  
  def file_type_column(imported_file)
    FILE_TYPE[imported_file.file_type]
  end
  
  def status_column(imported_file)
    STATUS[imported_file.status] unless imported_file.class != ImportedFile
  end
  
  def uploaded_data_form_column(record,input_name)
    file_field_tag input_name
  end  
end
