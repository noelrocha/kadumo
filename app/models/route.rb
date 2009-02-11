# == Schema Information
# Schema version: 20090210184740
#
# Table name: lcr
#
#  id         :integer         not null, primary key
#  prefix     :string(255)
#  from_uri   :string(255)
#  grp_id     :integer
#  priority   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Route < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['routes']  
  
  #validates_presence_of :prefix
  validates_presence_of :grp_id
  validates_presence_of :priority
  before_save :fix_prefix
  
  def to_label
     'route'
  end
  
  private
  def fix_prefix
    prefix = "" if prefix.nil?
  end  
  
end
