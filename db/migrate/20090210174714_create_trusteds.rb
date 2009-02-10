class CreateTrusteds < ActiveRecord::Migration
  def self.up
    create_table APP_TABLES_NAMES['trusted'] do |t|
      t.string :src_ip
      t.string :proto
      t.string :from_pattern
      t.string :tag

      t.timestamps
    end
  end

  def self.down
    drop_table APP_TABLES_NAMES['trusted']
  end
end
