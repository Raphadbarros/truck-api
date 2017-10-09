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

ActiveRecord::Schema.define(version: 20171008231937) do

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_contacts_on_shipment_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.datetime "deliver_at"
    t.integer "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_destinations_on_shipment_id"
  end

  create_table "last_locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.integer "trucker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trucker_id"], name: "index_last_locations_on_trucker_id"
  end

  create_table "origins", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.datetime "load_at"
    t.integer "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_origins_on_shipment_id"
  end

  create_table "shipment_vehicles", force: :cascade do |t|
    t.string "type"
    t.string "body_type"
    t.integer "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_shipment_vehicles_on_shipment_id"
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
