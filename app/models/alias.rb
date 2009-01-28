class Alias < ActiveRecord::Base
   set_table_name APP_TABLES_NAMES['dbaliases']
   belongs_to :subscriber, :foreign_key => [:username, :domain]
   validates_presence_of :alias_username, :alias_domain
   validates_associated :subscriber
   validates_uniqueness_of :alias_username, :scope => :alias_domain
   
   def to_label
     "#{self.alias_username}@#{self.alias_domain}"
   end
end
