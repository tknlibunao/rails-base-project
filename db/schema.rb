# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_16_021419) do

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "contact_number"
    t.text "address"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buyers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "contact_number"
    t.text "address"
    t.boolean "verified", default: false
    t.datetime "verified_at"
    t.string "created_by"
    t.integer "admin_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "market_portfolios", force: :cascade do |t|
    t.integer "market_id", null: false
    t.integer "portfolio_id", null: false
    t.decimal "price_bought", precision: 8, scale: 2
    t.decimal "volume_bought"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["market_id", "portfolio_id"], name: "index_market_portfolios_on_market_id_and_portfolio_id", unique: true
    t.index ["market_id"], name: "index_market_portfolios_on_market_id"
    t.index ["portfolio_id"], name: "index_market_portfolios_on_portfolio_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string "stock_name"
    t.string "symbol"
    t.decimal "volume"
    t.integer "trades"
    t.decimal "buying_price", precision: 8, scale: 2
    t.decimal "selling_price", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer "buyer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "buyer_id"
    t.decimal "actual_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "market_portfolios", "markets"
  add_foreign_key "market_portfolios", "portfolios"
end
