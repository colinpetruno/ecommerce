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

ActiveRecord::Schema.define(version: 20151031184917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "products_count"
  end

  create_table "coupons", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",                                null: false
    t.string   "code",                                null: false
    t.boolean  "redeemed",            default: false, null: false
    t.integer  "inventory"
    t.integer  "inventory_remaining"
    t.datetime "begins"
    t.datetime "expires"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "coupons", ["code"], name: "index_coupons_on_code", unique: true, using: :btree

  create_table "discounts", force: :cascade do |t|
    t.integer  "coupon_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "discounts", ["coupon_id"], name: "index_discounts_on_coupon_id", using: :btree
  add_index "discounts", ["order_id"], name: "index_discounts_on_order_id", using: :btree

  create_table "funding_instruments", force: :cascade do |t|
    t.string   "token"
    t.integer  "user_id"
    t.string   "type"
    t.string   "name"
    t.string   "account_type"
    t.string   "description"
    t.string   "number"
    t.string   "expiration_month"
    t.string   "expiration_year"
    t.string   "stripe_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "resource"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "imageable_type", null: false
    t.string   "photo_type"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "sku_id",                 null: false
    t.integer  "quantity",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "order_id"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "session_id",            null: false
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "email"
    t.integer  "funding_instrument_id"
  end

  create_table "page_views", force: :cascade do |t|
    t.string   "session_id"
    t.integer  "user_id"
    t.string   "page_url"
    t.string   "page_parameters"
    t.string   "user_agent"
    t.string   "ip_address"
    t.string   "location"
    t.string   "operating_system"
    t.string   "browser"
    t.string   "browser_version"
    t.string   "browser_major_version"
    t.string   "referrer"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "address_1",  null: false
    t.string   "address_2"
    t.string   "city",       null: false
    t.string   "first_name", null: false
    t.string   "last_name"
    t.string   "state",      null: false
    t.string   "zip",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skus", force: :cascade do |t|
    t.string   "name",                               null: false
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.integer  "product_id",                         null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "stripe_customers", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "stripe_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stripe_customers", ["email"], name: "index_stripe_customers_on_email", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.integer  "role",                   default: 0,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "order_items", "orders"
end
