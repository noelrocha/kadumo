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
  end
end
