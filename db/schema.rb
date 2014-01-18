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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140118131632) do

  create_table "airports", force: true do |t|
    t.string   "abbreviation"
    t.string   "city"
    t.string   "state"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bad_airlines", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bad_airlines_orders", force: true do |t|
    t.integer "bad_arline_id"
    t.integer "order_id"
  end

  create_table "orders", force: true do |t|
    t.string   "email"
    t.float    "max_price"
    t.datetime "departure_time_start"
    t.datetime "departure_time_end"
    t.datetime "return_time_start"
    t.integer  "return_time_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "start_airport_id"
    t.integer  "end_airport_id"
  end

end
