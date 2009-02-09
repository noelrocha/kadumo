class CreateDbAliases < ActiveRecord::Migration
  def self.up
    create_table APP_TABLES_NAMES['dbaliases'] do |t|
      t.string :username
      t.string :domain
      t.string :alias_username
      t.string :alias_domain

      t.timestamps
    end
  end

  def self.down
    drop_table APP_TABLES_NAMES['dbaliases']
  end
end
