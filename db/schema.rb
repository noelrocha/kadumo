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

ActiveRecord::Schema.define(:version => 20090212194331) do

  create_table "db_aliases", :force => true do |t|
    t.string   "username"
    t.string   "domain"
    t.string   "alias_username"
    t.string   "alias_domain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "db_aliases", ["alias_username", "alias_domain"], :name => "index_db_aliases_on_alias_username_and_alias_domain"

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
