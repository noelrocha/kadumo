class CreateSubscribers < ActiveRecord::Migration
  def self.up
    create_table APP_TABLES_NAMES['subscribers'] do |t|
      t.string :username
      t.string :password
      t.string :domain
      t.string :first_name
      t.string :last_name
      t.string :email_address

      t.timestamps
    end
    
    add_index APP_TABLES_NAMES['subscribers'], :username, :domain    
  end

  def self.down
    drop_table APP_TABLES_NAMES['subscribers']
  end
end
