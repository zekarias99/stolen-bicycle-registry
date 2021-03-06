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

ActiveRecord::Schema.define(version: 20131121191312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "bicycles", force: true do |t|
    t.date     "date"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "serial"
    t.boolean  "verified_ownership"
    t.string   "police_report"
    t.text     "description"
    t.integer  "reward"
    t.string   "brand"
    t.string   "model"
    t.string   "color"
    t.integer  "size"
    t.string   "size_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "country"
    t.integer  "user_id"
    t.string   "year"
    t.boolean  "approved",           default: false
    t.boolean  "hidden",             default: false
    t.boolean  "recovered",          default: false
    t.date     "recovered_date"
    t.boolean  "deleted",            default: false
    t.datetime "deleted_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.boolean  "first_name_public"
    t.string   "last_name"
    t.boolean  "last_name_public"
    t.boolean  "email_public"
    t.string   "country"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "phone1"
    t.string   "phone2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "deleted_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
end
