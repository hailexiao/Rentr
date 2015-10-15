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

ActiveRecord::Schema.define(version: 20151015180847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.integer  "month",          null: false
    t.integer  "amount",         null: false
    t.integer  "rental_unit_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "electric_utilities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "electric_utilities", ["name"], name: "index_electric_utilities_on_name", unique: true, using: :btree

  create_table "gas_utilities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "gas_utilities", ["name"], name: "index_gas_utilities_on_name", unique: true, using: :btree

  create_table "landlords", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "landlords", ["email"], name: "index_landlords_on_email", unique: true, using: :btree
  add_index "landlords", ["reset_password_token"], name: "index_landlords_on_reset_password_token", unique: true, using: :btree

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "boundaries"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "neighborhoods", ["name"], name: "index_neighborhoods_on_name", unique: true, using: :btree

  create_table "rental_units", force: :cascade do |t|
    t.string   "address",             null: false
    t.integer  "number_of_bedrooms",  null: false
    t.string   "type_of_dwelling",    null: false
    t.integer  "monthly_rent",        null: false
    t.integer  "tenant_id"
    t.integer  "landlord_id"
    t.integer  "electric_utility_id", null: false
    t.integer  "gas_utility_id",      null: false
    t.integer  "neighborhood_id",     null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "photos",                           array: true
  end

  add_index "rental_units", ["address"], name: "index_rental_units_on_address", unique: true, using: :btree

  create_table "tenants", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "tenants", ["email"], name: "index_tenants_on_email", unique: true, using: :btree
  add_index "tenants", ["reset_password_token"], name: "index_tenants_on_reset_password_token", unique: true, using: :btree

end
