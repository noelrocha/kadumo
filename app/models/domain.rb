class Domain < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['domains']
  validates_presence_of :name
  validates_uniqueness_of :name  
end
