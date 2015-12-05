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

ActiveRecord::Schema.define(version: 20151205161351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.string   "profile_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "actors_organizations", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.datetime "occured_at"
    t.string   "title"
    t.string   "summary"
    t.string   "url"
    t.integer  "user_id"
    t.integer  "issue_id"
    t.datetime "verified_at"
    t.integer  "verifier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "feeds", ["issue_id"], name: "index_feeds_on_issue_id", using: :btree
  add_index "feeds", ["user_id"], name: "index_feeds_on_user_id", using: :btree
  add_index "feeds", ["verifier_id"], name: "index_feeds_on_verifier_id", using: :btree

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.decimal  "financial_cost"
    t.string   "procurement_url"
    t.integer  "user_id"
    t.integer  "verifier_id"
    t.datetime "verified_at"
    t.integer  "status_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree
  add_index "issues", ["verifier_id"], name: "index_issues_on_verifier_id", using: :btree

  create_table "issues_actors", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues_organizations", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "organization_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "moderator",              default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "auth_token",                             null: false
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "feeds", "issues"
  add_foreign_key "feeds", "users"
  add_foreign_key "issues", "users"
end
