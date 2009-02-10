class CreateDialogs < ActiveRecord::Migration
  def self.up
    create_table APP_TABLES_NAMES['dialogs'] do |t|
      t.integer :hash_entry
      t.integer :hash_id
      t.string :callid
      t.string :from_uri
      t.string :from_tag
      t.string :to_uri
      t.string :to_tag
      t.string :caller_cseq
      t.string :callee_cseq
      t.string :caller_route_set
      t.string :callee_route_set
      t.string :caller_contact
      t.string :callee_contact
      t.string :caller_sock
      t.string :callee_sock
      t.integer :state
      t.timestamp :start_time
      t.integer :timeout

      t.timestamps
    end
  end

  def self.down
    drop_table APP_TABLES_NAMES['dialogs']
  end
end
