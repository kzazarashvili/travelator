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

ActiveRecord::Schema.define(version: 2019_05_29_200753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "abbreviation"
  end

  create_table "trips", force: :cascade do |t|
    t.date "started_at", null: false
    t.date "ended_at"
    t.integer "duration", default: 0
    t.bigint "user_id"
    t.boolean "past", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "active_duration"
    t.integer "past_duration"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visited_countries", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "country_id"
    t.index ["country_id"], name: "index_visited_countries_on_country_id"
    t.index ["trip_id"], name: "index_visited_countries_on_trip_id"
  end

  add_foreign_key "trips", "users"
  add_foreign_key "visited_countries", "countries"
  add_foreign_key "visited_countries", "trips"
end
