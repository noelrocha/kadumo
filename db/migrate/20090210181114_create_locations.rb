class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table APP_TABLES_NAMES['locations'] do |t|
      t.string :username
      t.string :domain
      t.string :contact
      t.string :received
      t.string :path
      t.datetime :expires
      t.float :q
      t.string :callid
      t.integer :cseq
      t.datetime :last_modified
      t.integer :flags
      t.integer :cflags
      t.string :user_agent
      t.string :socket
      t.integer :methods

      t.timestamps
    end
  end

  def self.down
    drop_table APP_TABLES_NAMES['locations']
  end
end
