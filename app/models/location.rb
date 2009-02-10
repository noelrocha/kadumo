class Location < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['locations']  
  
  def to_label
    "#{username}@#{domain}"
  end  
end
