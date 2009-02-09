class Gateway < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['gateways']
    
  validates_presence_of :gw_name
  validates_presence_of :ip_addr
  validates_presence_of :grp_id
  
  def to_label
    gw_name
  end
end
