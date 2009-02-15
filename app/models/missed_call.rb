# == Schema Information
# Schema version: 20090213065025
#
# Table name: missed_calls
#
#  id         :integer         not null, primary key
#  method     :string(255)
#  from_tag   :string(255)
#  to_tag     :string(255)
#  callid     :string(255)
#  sip_code   :string(255)
#  sip_reason :string(255)
#  time       :datetime
#  src_ip     :string(255)
#  dst_user   :string(255)
#  dst_domain :string(255)
#  src_user   :string(255)
#  src_domain :string(255)
#  cdr_id     :integer
#

class MissedCall < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['missed_calls']  
end
