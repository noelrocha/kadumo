# == Schema Information
# Schema version: 20090210184740
#
# Table name: trusted
#
#  id           :integer         not null, primary key
#  src_ip       :string(255)
#  proto        :string(255)
#  from_pattern :string(255)
#  tag          :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Trusted < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['trusted']
  
  validates_presence_of :src_ip
  validates_presence_of :proto
  
  def to_label
    "#{src_ip}:#{proto}"
  end  
end
