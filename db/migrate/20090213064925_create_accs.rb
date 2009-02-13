class CreateAccs < ActiveRecord::Migration
  def self.up
    create_table :acc do |t|
      t.string :method
      t.string :from_tag
      t.string :to_tag
      t.string :callid
      t.string :sip_code
      t.string :sip_reason
      t.datetime :time
      t.string :src_ip
      t.string :dst_user
      t.string :dst_domain
      t.string :src_user
      t.string :src_domain
      t.integer :cdr_id
    end
    add_index :acc, :method
    add_index :acc, :callid
  end

  def self.down
    drop_table :acc
  end
end
