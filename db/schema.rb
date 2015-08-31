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

ActiveRecord::Schema.define(version: 20150830085426) do

  create_table "identifiers", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identifiers", ["person_id"], name: "index_identifiers_on_person_id"

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "current_capacity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "movements", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "location_id"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "movements", ["location_id"], name: "index_movements_on_location_id"
  add_index "movements", ["person_id"], name: "index_movements_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school_identifier"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
