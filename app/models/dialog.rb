# == Schema Information
# Schema version: 20090212194331
#
# Table name: dialog
#
#  id               :integer         not null, primary key
#  hash_entry       :integer
#  hash_id          :integer
#  callid           :string(255)
#  from_uri         :string(255)
#  from_tag         :string(255)
#  to_uri           :string(255)
#  to_tag           :string(255)
#  caller_cseq      :string(255)
#  callee_cseq      :string(255)
#  caller_route_set :string(255)
#  callee_route_set :string(255)
#  caller_contact   :string(255)
#  callee_contact   :string(255)
#  caller_sock      :string(255)
#  callee_sock      :string(255)
#  state            :integer
#  start_time       :datetime
#  timeout          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Dialog < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['dialogs']
  
  def to_label
    callid
  end  
end
