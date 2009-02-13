class CreateAccs < ActiveRecord::Migration
  def self.up
    create_table APP_TABLES_NAMES['acc'] do |t|
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
    add_index APP_TABLES_NAMES['acc'], :method
    add_index APP_TABLES_NAMES['acc'], :callid
  end

  def self.down
    drop_table APP_TABLES_NAMES['acc']
  end
end
