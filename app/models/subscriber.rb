# == Schema Information
# Schema version: 20090210184740
#
# Table name: subscriber
#
#  id            :integer         not null, primary key
#  username      :string(255)
#  password      :string(255)
#  domain        :string(255)
#  first_name    :string(255)
#  last_name     :string(255)
#  email_address :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Subscriber < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['subscribers']

  belongs_to :domain, :foreign_key => 'domain' , :primary_key => 'domain'
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
