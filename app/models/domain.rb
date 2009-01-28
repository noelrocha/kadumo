class Domain < ActiveRecord::Base
  set_table_name APP_TABLES_NAMES['domains']
  has_many :subscribers, :foreign_key => 'domain' , :primary_key => 'name'
  validates_presence_of :name
  validates_uniqueness_of :name  
  
  def to_label
    "#{self.name}"
  end
end
