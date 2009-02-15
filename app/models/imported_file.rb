# == Schema Information
# Schema version: 20090213065025
#
# Table name: imported_files
#
#  id           :integer         not null, primary key
#  content_type :string(255)
#  filename     :string(255)
#  size         :integer
#  file_type    :integer
#  status       :integer         default(0)
#  created_at   :datetime
#  updated_at   :datetime
#

class ImportedFile < ActiveRecord::Base
  has_attachment :storage => :file_system,
                 :max_size => 500.kilobytes,
                 :path_prefix => 'imported_files',
                 :processor => :none
end
