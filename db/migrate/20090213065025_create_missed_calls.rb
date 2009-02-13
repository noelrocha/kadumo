class CreateMissedCalls < ActiveRecord::Migration
  def self.up
    create_table :missed_calls do |t|
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
    add_index :missed_calls, :method
    add_index :missed_calls, :callid
  end

  def self.down
    drop_table :missed_calls
  end
end
