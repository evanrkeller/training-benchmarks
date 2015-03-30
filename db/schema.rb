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

ActiveRecord::Schema.define(version: 20150329231221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bmarks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "track_id"
    t.integer  "stage_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bmarks", ["stage_id"], name: "index_bmarks_on_stage_id", using: :btree
  add_index "bmarks", ["track_id"], name: "index_bmarks_on_track_id", using: :btree

  create_table "practices", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practices_users", force: :cascade do |t|
    t.integer "practice_id"
    t.integer "user_id"
  end

  add_index "practices_users", ["practice_id", "user_id"], name: "index_practices_users_on_practice_id_and_user_id", using: :btree
  add_index "practices_users", ["practice_id"], name: "index_practices_users_on_practice_id", using: :btree
  add_index "practices_users", ["user_id"], name: "index_practices_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sign_offs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bmark_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sign_offs", ["bmark_id"], name: "index_sign_offs_on_bmark_id", using: :btree
  add_index "sign_offs", ["user_id"], name: "index_sign_offs_on_user_id", using: :btree

  create_table "stages", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "track_id"
    t.integer  "role_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["track_id"], name: "index_users_on_track_id", using: :btree

  add_foreign_key "bmarks", "stages"
  add_foreign_key "bmarks", "tracks"
  add_foreign_key "sign_offs", "bmarks"
  add_foreign_key "sign_offs", "users"
  add_foreign_key "users", "tracks"
end
