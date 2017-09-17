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

ActiveRecord::Schema.define(version: 20170730171400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboards", force: :cascade do |t|
    t.bigint "user_id"
    t.string "origin_address"
    t.string "destination_address"
    t.string "weather_api_key"
    t.string "google_api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dashboards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "home_city"
    t.string "home_address"
    t.string "work_city"
    t.string "work_address"
    t.string "home_state"
    t.string "work_state"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "widget_data", force: :cascade do |t|
    t.string "data"
    t.bigint "widget_id"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_widget_data_on_user_id"
    t.index ["widget_id"], name: "index_widget_data_on_widget_id"
  end

  create_table "widgets", force: :cascade do |t|
    t.string "name"
    t.string "data_url"
    t.string "field_names"
  end

  add_foreign_key "dashboards", "users"
  add_foreign_key "widget_data", "users"
  add_foreign_key "widget_data", "widgets"
end
