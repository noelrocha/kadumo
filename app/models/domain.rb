# == Schema Information
# Schema version: 20090210184740
#
# Table name: domain
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Domain < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['domains']
  has_many :subscribers, :foreign_key => 'domain' , :primary_key => 'name'
  validates_presence_of :name
  validates_uniqueness_of :name  
  
  def to_label
    "#{self.name}"
  end
end
