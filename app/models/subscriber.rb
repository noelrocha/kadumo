class Subscriber < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['subscribers']
  belongs_to :domain, :foreign_key => 'domain'
  validates_presence_of :username, :password, :domain
  validates_uniqueness_of :username, :scope => :domain  
end
