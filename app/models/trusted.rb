class Trusted < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['trusted']
  
  validates_presence_of :src_ip
  validates_presence_of :proto
  
  def to_label
    "#{src_ip}:#{proto}"
  end  
end
