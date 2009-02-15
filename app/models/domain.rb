# == Schema Information
# Schema version: 20090213065025
#
# Table name: domain
#
#  id         :integer         not null, primary key
#  domain     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Domain < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['domains']
  has_many :subscribers, :foreign_key => 'domain' , :primary_key => 'domain'
  validates_presence_of :domain
  validates_uniqueness_of :domain  
  
  def to_label
    "#{self.domain}"
  end
end
