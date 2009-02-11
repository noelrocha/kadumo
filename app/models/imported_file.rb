class ImportedFile < ActiveRecord::Base
  has_attachment :storage => :file_system,
                 :max_size => 500.kilobytes,
                 :path_prefix => 'imported_files',
                 :processor => :none
end
