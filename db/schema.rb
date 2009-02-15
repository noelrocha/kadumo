# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090215052822) do

  create_table "acc", :force => true do |t|
    t.string   "method"
    t.string   "from_tag"
    t.string   "to_tag"
    t.string   "callid"
    t.string   "sip_code"
    t.string   "sip_reason"
    t.datetime "time"
    t.string   "src_ip"
    t.string   "dst_user"
    t.string   "dst_domain"
    t.string   "src_user"
    t.string   "src_domain"
    t.integer  "cdr_id"
  end

  add_index "acc", ["callid"], :name => "index_acc_on_callid"
  add_index "acc", ["method"], :name => "index_acc_on_method"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "changes"
    t.integer  "version",        :default => 0
    t.datetime "created_at"
  end

  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "cdrs", :force => true do |t|
    t.string   "src_username"
    t.string   "src_domain"
    t.string   "dst_username"
    t.string   "dst_domain"
    t.datetime "start_time"
    t.integer  "duration"
    t.string   "sip_call_id"
    t.string   "sip_from_tag"
    t.string   "sip_to_tag"
    t.string   "src_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cdrs", ["sip_call_id", "sip_from_tag", "sip_to_tag"], :name => "index_cdrs_on_sip_call_id_and_sip_from_tag_and_sip_to_tag"

  create_table "dbaliases", :force => true do |t|
    t.string   "username"
    t.string   "domain"
    t.string   "alias_username"
    t.string   "alias_domain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dbaliases", ["alias_username", "alias_domain"], :name => "index_dbaliases_on_alias_username_and_alias_domain"

  create_table "dialog", :force => true do |t|
    t.integer  "hash_entry"
    t.integer  "hash_id"
    t.string   "callid"
    t.string   "from_uri"
    t.string   "from_tag"
    t.string   "to_uri"
    t.string   "to_tag"
    t.string   "caller_cseq"
    t.string   "callee_cseq"
    t.string   "caller_route_set"
    t.string   "callee_route_set"
    t.string   "caller_contact"
    t.string   "callee_contact"
    t.string   "caller_sock"
    t.string   "callee_sock"
    t.integer  "state"
    t.datetime "start_time"
    t.integer  "timeout"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domain", :force => true do |t|
    t.string   "domain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "domain", ["domain"], :name => "index_domain_on_domain"

  create_table "grp", :force => true do |t|
    t.string   "username"
    t.string   "domain"
    t.string   "grp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gw", :force => true do |t|
    t.string   "gw_name"
    t.integer  "grp_id"
    t.string   "ip_addr"
    t.integer  "port"
    t.integer  "uri_scheme"
    t.integer  "transport"
    t.integer  "strip"
    t.string   "tag"
    t.integer  "flags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imported_files", :force => true do |t|
    t.string   "content_type"
    t.string   "filename"
    t.integer  "size"
    t.integer  "file_type"
    t.integer  "status",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.string   "worker_class"
    t.string   "worker_method"
    t.text     "args"
    t.text     "result"
    t.integer  "priority"
    t.integer  "progress"
    t.string   "state"
    t.integer  "lock_version",  :default => 0
    t.datetime "start_at"
    t.datetime "started_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["priority"], :name => "index_jobs_on_priority"
  add_index "jobs", ["start_at"], :name => "index_jobs_on_start_at"
  add_index "jobs", ["state"], :name => "index_jobs_on_state"

  create_table "lcr", :force => true do |t|
    t.string   "prefix"
    t.string   "from_uri"
    t.integer  "grp_id"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location", :force => true do |t|
    t.string   "username"
    t.string   "domain"
    t.string   "contact"
    t.string   "received"
    t.string   "path"
    t.datetime "expires"
    t.float    "q"
    t.string   "callid"
    t.integer  "cseq"
    t.datetime "last_modified"
    t.integer  "flags"
    t.integer  "cflags"
    t.string   "user_agent"
    t.string   "socket"
    t.integer  "methods"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missed_calls", :force => true do |t|
    t.string   "method"
    t.string   "from_tag"
    t.string   "to_tag"
    t.string   "callid"
    t.string   "sip_code"
    t.string   "sip_reason"
    t.datetime "time"
    t.string   "src_ip"
    t.string   "dst_user"
    t.string   "dst_domain"
    t.string   "src_user"
    t.string   "src_domain"
    t.integer  "cdr_id"
  end

  add_index "missed_calls", ["callid"], :name => "index_missed_calls_on_callid"
  add_index "missed_calls", ["method"], :name => "index_missed_calls_on_method"

  create_table "subscriber", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "domain"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "rpid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriber", ["username", "domain"], :name => "index_subscriber_on_username_and_domain"

  create_table "trusted", :force => true do |t|
    t.string   "src_ip"
    t.string   "proto"
    t.string   "from_pattern"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
