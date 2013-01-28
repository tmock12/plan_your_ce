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

ActiveRecord::Schema.define(:version => 20130127142443) do

  create_table "addresses", :force => true do |t|
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.integer  "course_id"
    t.integer  "provider_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "admins", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admins", ["user_id"], :name => "index_admins_on_user_id"

  create_table "airports", :force => true do |t|
    t.string   "title"
    t.string   "iata_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "airports", ["title"], :name => "index_airports_on_location"

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "price"
    t.string   "instructor"
    t.string   "phone"
    t.string   "email"
    t.string   "credits"
    t.string   "max_attendance"
    t.string   "category"
    t.text     "audience"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "provider_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "courses", ["category"], :name => "index_courses_on_category"

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.string   "cerp_number"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.datetime "activated_at"
    t.integer  "user_id"
    t.boolean  "rejected",     :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "role"
  end

end
