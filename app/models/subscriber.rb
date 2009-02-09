class Subscriber < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['subscribers']

  belongs_to :domain, :foreign_key => 'domain' , :primary_key => 'name'
  #has_many :aliases, :foreign_key => [:username, :domain]
  
  validates_presence_of :username, :password, :domain
  validates_uniqueness_of :username, :scope => :domain  
  validates_associated :domain
  
  def to_label
    "#{self.username}@#{self.domain.name}"
  end
  
  def aliases
    DbAlias.find(:all, :conditions => {:username => self.username, :domain => self.domain.name })
  end
  
end
