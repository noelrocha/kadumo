class Group < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['group']  
  belongs_to :domain, :class_name => "Domain", :foreign_key => 'domain' , :primary_key => 'domain'     
  
  validates_presence_of :username
  validates_presence_of :domain
  validates_presence_of :grp    
end
