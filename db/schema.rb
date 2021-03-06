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

ActiveRecord::Schema.define(version: 20170406231325) do

  create_table "add_cinema_number_to_orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string   "card_number", limit: 255
    t.float    "amount",      limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "is_redeemed"
  end

  create_table "chains", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "mall_id",        limit: 4
    t.string   "chain_logo",     limit: 255
    t.float    "amount_balance", limit: 24
  end

  add_index "chains", ["mall_id"], name: "index_chains_on_mall_id", using: :btree

  create_table "chains_malls", force: :cascade do |t|
    t.integer  "chain_id",   limit: 4
    t.integer  "mall_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.float    "price",       limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "menu_id",     limit: 4
    t.string   "item_image",  limit: 255
  end

  add_index "items", ["menu_id"], name: "index_items_on_menu_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "province",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "malls", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "address",     limit: 65535
    t.integer  "location_id", limit: 4
  end

  add_index "malls", ["location_id"], name: "index_malls_on_location_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "chain_id",   limit: 4
  end

  add_index "menus", ["chain_id"], name: "index_menus_on_chain_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "item_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   limit: 4
    t.float    "subtotal",   limit: 24
    t.string   "name",       limit: 255
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.float    "total",            limit: 24
    t.string   "reference_number", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id",          limit: 4
    t.string   "cinema_number",    limit: 255
    t.string   "remarks",          limit: 255
    t.string   "contact_number",   limit: 255
    t.string   "status",           limit: 255
    t.integer  "chain_id",         limit: 4
    t.integer  "mall_id",          limit: 4
    t.integer  "payment_method",   limit: 4
  end

  add_index "orders", ["chain_id"], name: "index_orders_on_chain_id", using: :btree
  add_index "orders", ["mall_id"], name: "index_orders_on_mall_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "redemptions", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",     limit: 4
    t.integer  "card_id",     limit: 4
    t.string   "card_number", limit: 255
  end

  add_index "redemptions", ["card_id"], name: "index_redemptions_on_card_id", using: :btree
  add_index "redemptions", ["card_number"], name: "index_redemptions_on_card_number", using: :btree
  add_index "redemptions", ["user_id"], name: "index_redemptions_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",      null: false
    t.string   "encrypted_password",     limit: 255,   default: "",      null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "chain_id",               limit: 4
    t.string   "provider",               limit: 255,   default: "email"
    t.string   "uid",                    limit: 255,   default: ""
    t.text     "tokens",                 limit: 65535
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.float    "account_balance",        limit: 24
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
