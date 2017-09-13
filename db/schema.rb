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

ActiveRecord::Schema.define(version: 20170808164921) do

  create_table "buyers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postcode"
    t.string   "city"
    t.string   "nip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string   "car_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
  end

  create_table "fuels", force: :cascade do |t|
    t.float    "liters"
    t.date     "tank_date"
    t.integer  "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_fuels_on_car_id"
  end

  create_table "pln_invoice_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "quantity"
    t.decimal  "price_netto"
    t.decimal  "price_brutto"
    t.integer  "vat"
    t.decimal  "total"
    t.integer  "pln_invoice_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "total_netto"
    t.decimal  "total_brutto"
    t.decimal  "vat_value"
    t.index ["pln_invoice_id"], name: "index_pln_invoice_items_on_pln_invoice_id"
  end

  create_table "pln_invoices", force: :cascade do |t|
    t.string   "number"
    t.string   "city"
    t.date     "inv_date"
    t.date     "sell_date"
    t.string   "payment_form"
    t.integer  "payment_term"
    t.date     "payment_day"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "original"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.decimal  "sum_netto"
    t.decimal  "sum_vat_value"
    t.decimal  "sum_total"
    t.index ["buyer_id"], name: "index_pln_invoices_on_buyer_id"
    t.index ["seller_id"], name: "index_pln_invoices_on_seller_id"
  end

  create_table "rates", force: :cascade do |t|
    t.string   "currency"
    t.string   "table"
    t.decimal  "value_currency"
    t.decimal  "value_pln"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "table_date"
    t.date     "date"
    t.decimal  "converter"
    t.integer  "car_id"
    t.boolean  "payment"
    t.boolean  "printed"
    t.string   "description"
    t.index ["car_id"], name: "index_rates_on_car_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "postcode"
    t.string   "nip"
    t.string   "regon"
    t.string   "bank_name"
    t.string   "account_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
