class CreateCdrs < ActiveRecord::Migration
  def self.up
    create_table :cdrs do |t|
      t.string :src_username
      t.string :src_domain
      t.string :dst_username
      t.string :dst_domain
      t.datetime :start_time
      t.integer :duration
      t.string :sip_call_id
      t.string :sip_from_tag
      t.string :sip_to_tag
      t.string :src_ip

      t.timestamps
    end  
    add_index :cdrs, [:sip_call_id, :sip_from_tag, :sip_to_tag]
    
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

    execute <<-eos
      CREATE PROCEDURE `cdrs_builder`()
      BEGIN
        DECLARE done INT DEFAULT 0;
        DECLARE bye_record INT DEFAULT 0;
        DECLARE v_src_user,v_src_domain,v_dst_user,v_dst_domain,v_callid,v_from_tag, v_to_tag,v_src_ip VARCHAR(64);
        DECLARE v_inv_time, v_bye_time DATETIME;
        DECLARE inv_cursor CURSOR FOR SELECT src_user, src_domain, dst_user, dst_domain, time, callid,from_tag, to_tag, src_ip FROM openser.acc where method='INVITE' and cdr_id is null;
        DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
        OPEN inv_cursor;
        REPEAT
          FETCH inv_cursor INTO v_src_user, v_src_domain, v_dst_user, v_dst_domain, v_inv_time, v_callid, v_from_tag, v_to_tag, v_src_ip;
          IF NOT done THEN
            SET bye_record = 0;
            SELECT 1, time INTO bye_record, v_bye_time FROM openser.acc WHERE method='BYE' AND callid=v_callid AND ((from_tag=v_from_tag AND to_tag=v_to_tag) OR   (from_tag=v_to_tag AND to_tag=v_from_tag)) ORDER BY time ASC LIMIT 1;
            IF bye_record = 1 THEN
              INSERT INTO openser.cdrs (src_username,src_domain,dst_username,dst_domain,start_time,duration,sip_call_id,sip_from_tag,sip_to_tag,src_ip,created_at) VALUES (v_src_user,v_src_domain,v_dst_user,v_dst_domain,v_inv_time,UNIX_TIMESTAMP(v_bye_time)-UNIX_TIMESTAMP(v_inv_time),v_callid,v_from_tag,v_to_tag,v_src_ip,NOW());
              UPDATE acc SET cdr_id=last_insert_id() WHERE callid=v_callid AND from_tag=v_from_tag AND to_tag=v_to_tag;
            END IF;
            SET done = 0;
          END IF;
        UNTIL done END REPEAT;
      END    
    eos

  end

  def self.down
    drop_table :cdrs
    drop_table :acc
    drop_table :missed_calls    
  end
end
