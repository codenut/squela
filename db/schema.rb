# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130629092639) do

  create_table "comments", :force => true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "workitem_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "priorities", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "url"
    t.string   "description"
    t.boolean  "is_deleted",  :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "streams", :force => true do |t|
    t.string   "json_object"
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "description"
    t.boolean  "is_cleared",  :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "user_details", :force => true do |t|
    t.integer  "user_id"
    t.string   "fullname"
    t.integer  "type_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_deleted",             :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "workitem_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "watches", :force => true do |t|
    t.integer  "user_id"
    t.integer  "workitem_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "workitem_statuses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "workitem_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "workitems", :force => true do |t|
    t.string   "summary"
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "workitem_type_id"
    t.integer  "workitem_status_id"
    t.integer  "priority_id"
    t.integer  "points"
    t.string   "estimate"
    t.string   "tags"
    t.date     "due_date"
    t.string   "description"
    t.boolean  "is_deleted",         :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
