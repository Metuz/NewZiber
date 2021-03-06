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

ActiveRecord::Schema.define(version: 20151130164228) do

  create_table "admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "pin"
    t.text     "policy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "slogan"
  end

  create_table "break_products", force: true do |t|
    t.string   "model"
    t.string   "serial"
    t.integer  "brand_id"
    t.integer  "report_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "costs", force: true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "price"
    t.decimal  "total"
    t.integer  "report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inspections", force: true do |t|
    t.string   "title"
    t.string   "comment"
    t.boolean  "finish"
    t.string   "serial"
    t.integer  "report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "name"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "pin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.text     "text1"
    t.text     "text2"
    t.text     "text3"
    t.text     "text4"
    t.text     "text5"
    t.text     "text6"
    t.text     "text7"
    t.text     "text8"
    t.text     "text9"
    t.text     "text10"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text11"
    t.text     "text12"
    t.text     "text13"
    t.text     "text14"
    t.text     "text15"
    t.text     "text16"
    t.text     "text17"
    t.text     "text18"
    t.text     "text19"
    t.text     "text20"
    t.text     "text21"
    t.text     "text22"
    t.text     "text23"
    t.text     "text24"
    t.text     "text25"
    t.text     "text26"
    t.text     "text27"
    t.text     "text28"
    t.text     "text29"
    t.text     "text30"
    t.text     "text31"
    t.text     "text32"
    t.text     "text33"
    t.text     "text34"
    t.text     "text35"
    t.text     "text36"
    t.text     "text37"
    t.text     "text38"
    t.text     "text39"
    t.text     "text40"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "brand_id"
    t.integer  "location_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sum"
  end

  create_table "questions", force: true do |t|
    t.string   "name"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.string   "pin"
    t.integer  "client_id"
    t.integer  "technician_id"
    t.integer  "location_id"
    t.string   "model"
    t.string   "store"
    t.datetime "bought_at"
    t.string   "serial"
    t.integer  "brand_id"
    t.boolean  "policy",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "delivered_at"
    t.boolean  "delivered",     default: false
    t.string   "receptionist"
    t.boolean  "finish",        default: false
    t.decimal  "total"
    t.text     "comment"
    t.string   "cooler_pin"
  end

  add_index "reports", ["serial"], name: "index_reports_on_serial", unique: true

  create_table "secretaries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_costs", force: true do |t|
    t.string   "serial"
    t.string   "company"
    t.integer  "report_id"
    t.datetime "date"
    t.decimal  "total"
    t.boolean  "shipping_by_company"
    t.boolean  "shipping_by_client"
    t.string   "client"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technicians", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
