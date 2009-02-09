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
    debugger
    prefix = "" if prefix.nil?
  end  
  
end
