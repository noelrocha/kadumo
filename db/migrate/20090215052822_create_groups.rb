class CreateGroups < ActiveRecord::Migration
  def self.up  
    create_table APP_TABLES_NAMES['group'] do |t|
      t.string :username
      t.string :domain
      t.string :grp

      t.timestamps
    end
  end

  def self.down
    drop_table APP_TABLES_NAMES['group']
  end
end
