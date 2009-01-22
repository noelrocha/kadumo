class Domain < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['domains']
  has_many :subscribers, :primary_key => :name, :foreign_key => :domain  
  validates_presence_of :name
  validates_uniqueness_of :name  
  
  def to_label
    "#{name}"
  end
  
end
