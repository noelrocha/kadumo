class DbAlias < ActiveRecord::Base

  set_table_name APP_TABLES_NAMES['dbaliases']
  #set_primary_keys :id

  belongs_to :domain, :class_name => "Domain", :foreign_key => 'domain' , :primary_key => 'name'   
  validates_presence_of :username, :domain, :alias_username, :alias_domain
  validates_uniqueness_of :alias_username, :scope => :alias_domain

  #belongs_to :subscriber, :foreign_key => [:username, :domain]
  #validates_associated :subscriber
  
  def to_label
    "#{self.alias_username}@#{self.alias_domain}"
  end
  
  def subscriber
    Subscriber.find(:first, :conditions => {:username => self.username, :domain => self.domain })
  end
  
  def subscriber=(subscriber)
    self.username = subscriber.username
    self.domain = subscriber.domain
  end

end