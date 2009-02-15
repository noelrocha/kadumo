# == Schema Information
# Schema version: 20090213065025
#
# Table name: cdrs
#
#  id           :integer         not null, primary key
#  src_username :string(255)
#  src_domain   :string(255)
#  dst_username :string(255)
#  dst_domain   :string(255)
#  start_time   :datetime
#  duration     :integer
#  sip_call_id  :string(255)
#  sip_from_tag :string(255)
#  sip_to_tag   :string(255)
#  src_ip       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Cdr < ActiveRecord::Base
end
