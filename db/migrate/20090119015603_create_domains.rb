class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table APP_TABLES_NAMES['domains'] do |t|
      t.string :name

      t.timestamps
    end
    
    add_index APP_TABLES_NAMES['domains'], :name
  end

  def self.down
    drop_table APP_TABLES_NAMES['domains']
  end
end
