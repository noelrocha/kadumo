# == Schema Information
# Schema version: 20090213065025
#
# Table name: location
#
#  id            :integer         not null, primary key
#  username      :string(255)
#  domain        :string(255)
#  contact       :string(255)
#  received      :string(255)
#  path          :string(255)
#  expires       :datetime
#  q             :float
#  callid        :string(255)
#  cseq          :integer
#  last_modified :datetime
#  flags         :integer
#  cflags        :integer
#  user_agent    :string(255)
#  socket        :string(255)
#  methods       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Location < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['locations']  
  
  def to_label
    "#{username}@#{domain}"
  end  
end
