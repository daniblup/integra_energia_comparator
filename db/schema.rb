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

ActiveRecord::Schema.define(version: 20150626201545) do

  create_table "clients", force: :cascade do |t|
    t.string   "email",        limit: 255
    t.string   "postal_code",  limit: 255
    t.string   "phone_number", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "comparatives", force: :cascade do |t|
    t.integer  "current_cost",      limit: 4
    t.integer  "integra_cost",      limit: 4
    t.integer  "installation_cost", limit: 4
    t.float    "amortization_term", limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "client_id",         limit: 4
  end

  add_index "comparatives", ["client_id"], name: "fk_rails_36cf282c5c", using: :btree

  create_table "comparatives_products", force: :cascade do |t|
    t.integer  "comparative_id", limit: 4
    t.integer  "product_id",     limit: 4
    t.integer  "amount",         limit: 4
    t.integer  "hours_use",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.integer  "consumption_w",       limit: 4
    t.string   "name_equiv",          limit: 255
    t.integer  "consumption_w_equiv", limit: 4
    t.float    "price_equiv",         limit: 24
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comparatives", "clients"
end
