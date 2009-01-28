class CreateAliases < ActiveRecord::Migration
  def self.up
    create_table :aliases do |t|
      t.string :username
      t.string :domain
      t.string :alias_username
      t.string :alias_domain

      t.timestamps
    end
  end

  def self.down
    drop_table :aliases
  end
end
