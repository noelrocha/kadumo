class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :prefix
      t.string :from_uri
      t.integer :grp_id
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
