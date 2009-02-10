class Dialog < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['dialogs']
  
  def to_label
    callid
  end  
end
