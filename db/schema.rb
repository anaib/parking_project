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

ActiveRecord::Schema.define(version: 20161215145827) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "private_parking_spots", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.date     "date"
    t.string   "starting_time"
    t.string   "duration"
    t.integer  "points"
    t.string   "car_type"
    t.text     "description"
    t.integer  "offer_user_id"
    t.integer  "accept_user_id"
    t.string   "parking_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "neigh"
    t.string   "string"
  end

  create_table "public_parking_spots", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.string   "date"
    t.string   "starting_time"
    t.string   "max_time"
    t.string   "car_type"
    t.integer  "street_parking_price"
    t.text     "description"
    t.integer  "pub_offer_user_id"
    t.integer  "points"
    t.integer  "offer_user_id"
    t.integer  "accept_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "city"
    t.string   "zipcode"
    t.string   "time"
    t.date     "date"
    t.integer  "offer_user_id"
    t.integer  "accept_user_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "accept_points"
    t.integer  "offer_points"
  end

  create_table "spots_informations", force: :cascade do |t|
    t.string   "city"
    t.integer  "user_id"
    t.string   "zipcode"
    t.text     "streets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_thanks"
    t.integer  "pts"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "phone_number"
    t.integer  "points"
    t.string   "password"
    t.string   "car_registration"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "pts"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
