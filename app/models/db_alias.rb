# == Schema Information
# Schema version: 20090210184740
#
# Table name: db_aliases
#
#  id             :integer         not null, primary key
#  username       :string(255)
#  domain         :string(255)
#  alias_username :string(255)
#  alias_domain   :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class DbAlias < ActiveRecord::Base

  set_table_name APP_TABLES_NAMES['dbaliases']

  belongs_to :domain, :class_name => "Domain", :foreign_key => 'domain' , :primary_key => 'domain'   
  validates_presence_of :alias_username, :alias_domain
  validates_presence_of :username, :unless => Proc.new { |dbalias| dbalias.domain.nil? }
  validates_uniqueness_of :alias_username, :scope => :alias_domain

  #set_primary_keys :id
  #belongs_to :subscriber, :foreign_key => [:username, :domain]
  #validates_associated :subscriber
  
  def to_label
    "#{self.alias_username}@#{self.alias_domain}"
  end
  
  def subscriber
    Subscriber.find(:first, :conditions => {:username => self.username, :domain => self.domain.domain })
  end
  
  def subscriber=(subscriber)
    self.username = subscriber.username
    self.domain = subscriber.domain
  end

end
