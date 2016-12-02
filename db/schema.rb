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

ActiveRecord::Schema.define(version: 20161201174133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_histories", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "location_id"
    t.integer  "user_id"
    t.boolean  "discovered"
    t.boolean  "hint1_used"
    t.boolean  "hint2_used"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "game_histories", ["game_id", "location_id", "user_id"], name: "index_game_histories_on_game_id_and_location_id_and_user_id", unique: true, using: :btree
  add_index "game_histories", ["game_id"], name: "index_game_histories_on_game_id", using: :btree
  add_index "game_histories", ["location_id"], name: "index_game_histories_on_location_id", using: :btree
  add_index "game_histories", ["user_id"], name: "index_game_histories_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "title"
    t.integer  "duration"
    t.date     "starts_at_date"
    t.time     "starts_at_time"
    t.integer  "organizer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "games", ["organizer_id"], name: "index_games_on_organizer_id", using: :btree

  create_table "hunts", id: false, force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hunts", ["game_id", "location_id"], name: "index_hunts_on_game_id_and_location_id", unique: true, using: :btree
  add_index "hunts", ["game_id"], name: "index_hunts_on_game_id", using: :btree
  add_index "hunts", ["location_id"], name: "index_hunts_on_location_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.text     "description"
    t.integer  "points"
    t.string   "hint1"
    t.string   "hint2"
    t.integer  "hint1_points"
    t.integer  "hint2_points"
    t.string   "area"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "plays", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "points"
    t.integer  "finish_time"
    t.integer  "rank"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "plays", ["game_id", "user_id"], name: "index_plays_on_game_id_and_user_id", unique: true, using: :btree
  add_index "plays", ["game_id"], name: "index_plays_on_game_id", using: :btree
  add_index "plays", ["user_id"], name: "index_plays_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "password_digest"
    t.string   "firstname",                       null: false
    t.string   "lastname"
    t.string   "username",                        null: false
    t.boolean  "is_admin",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "game_histories", "games"
  add_foreign_key "game_histories", "locations"
  add_foreign_key "game_histories", "users"
  add_foreign_key "games", "users", column: "organizer_id"
  add_foreign_key "hunts", "games"
  add_foreign_key "hunts", "locations"
  add_foreign_key "plays", "games"
  add_foreign_key "plays", "users"
end
