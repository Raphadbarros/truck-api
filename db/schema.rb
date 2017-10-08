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

ActiveRecord::Schema.define(version: 20171008011822) do

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_contacts_on_shipment_id"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "origin_id"
    t.integer "destination_id"
    t.datetime "load_at"
    t.datetime "delivered_at"
    t.integer "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_routes_on_shipment_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.float "value"
    t.float "weight_kg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truckers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "type"
    t.string "body_type"
    t.integer "trucker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trucker_id"], name: "index_vehicles_on_trucker_id"
  end

end
