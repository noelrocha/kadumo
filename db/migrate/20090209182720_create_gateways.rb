class CreateGateways < ActiveRecord::Migration
  def self.up
    create_table APP_TABLES_NAMES['gateways'] do |t|
      t.string :gw_name
      t.integer :grp_id
      t.string :ip_addr
      t.integer :port
      t.integer :uri_scheme
      t.integer :transport
      t.integer :strip
      t.string :tag
      t.integer :flags

      t.timestamps
    end
  end

  def self.down
    drop_table APP_TABLES_NAMES['gateways']
  end
end
