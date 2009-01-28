class Subscriber < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['subscribers']
  set_primary_keys :username, :domain
  #belongs_to :domain, :foreign_key => 'domain' , :primary_key => 'name'
  has_many :aliases, :foreign_key => [:username, :domain]
  validates_presence_of :username, :password, :domain
  #validates_associated :domain
  validates_uniqueness_of :username, :scope => :domain  
  
  def to_label
    "#{self.username}@#{self.domain}"
  end
  
  # def domain_name
  #   self.domain.nil? ? nil : self.domain.name
  # end
end
