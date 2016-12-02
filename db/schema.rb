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

ActiveRecord::Schema.define(version: 20161201094933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer  "users_id"
    t.integer  "topics_id"
    t.integer  "questions_id"
    t.integer  "lives"
    t.integer  "level"
    t.datetime "created_at",   default: "now()", null: false
    t.datetime "updated_at",   default: "now()", null: false
  end

  add_index "progresses", ["questions_id"], name: "index_progresses_on_questions_id", using: :btree
  add_index "progresses", ["topics_id"], name: "index_progresses_on_topics_id", using: :btree
  add_index "progresses", ["users_id"], name: "index_progresses_on_users_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.string   "a"
    t.string   "b"
    t.string   "c"
    t.string   "d"
    t.string   "answer"
    t.integer  "zones_id"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
  end

  add_index "questions", ["zones_id"], name: "index_questions_on_zones_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.integer  "towers_id"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
  end

  add_index "topics", ["towers_id"], name: "index_topics_on_towers_id", using: :btree

  create_table "towers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "nationality"
    t.date     "date_of_birth"
    t.integer  "contact"
    t.string   "email"
    t.datetime "created_at",      default: "now()", null: false
    t.datetime "updated_at",      default: "now()", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.integer  "difficulty"
    t.integer  "topics_id"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
  end

  add_index "zones", ["topics_id"], name: "index_zones_on_topics_id", using: :btree

end
