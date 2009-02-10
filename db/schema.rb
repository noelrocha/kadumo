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

ActiveRecord::Schema.define(:version => 20090210174714) do

  create_table "db_aliases", :force => true do |t|
    t.string   "username"
    t.string   "domain"
    t.string   "alias_username"
    t.string   "alias_domain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domain", :force => true do |t|
    t.string   "name"
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

  create_table "lcr", :force => true do |t|
    t.string   "prefix"
    t.string   "from_uri"
    t.integer  "grp_id"
    t.integer  "priority"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trusted", :force => true do |t|
    t.string   "src_ip"
    t.string   "proto"
    t.string   "from_pattern"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
