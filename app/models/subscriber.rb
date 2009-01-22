class Subscriber < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['subscribers']
  belongs_to :domain, :class_name => 'Domain', :primary_key => :name , :foreign_key => :domain
  validates_presence_of :username, :password, :domain
  validates_uniqueness_of :username, :scope => :domain  
  
  def to_label
    "#{username}@#{domain}"
  end
end
