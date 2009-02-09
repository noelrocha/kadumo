class Gateway < ActiveRecord::Base
  validates_presence_of :gw_name
  validates_presence_of :ip_addr
  validates_presence_of :grp_id
  
  def to_label
    gw_name
  end
end
