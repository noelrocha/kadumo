class Gateway < ActiveRecord::Base
  validates_presence_of :gw_name
  validates_presence_of :ip_addr
end
