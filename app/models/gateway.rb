# == Schema Information
# Schema version: 20090213065025
#
# Table name: gw
#
#  id         :integer         not null, primary key
#  gw_name    :string(255)
#  grp_id     :integer
#  ip_addr    :string(255)
#  port       :integer
#  uri_scheme :integer
#  transport  :integer
#  strip      :integer
#  tag        :string(255)
#  flags      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Gateway < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['gateways']
    
  validates_presence_of :gw_name
  validates_presence_of :ip_addr
  validates_presence_of :grp_id
  
  def to_label
    gw_name
  end
end
