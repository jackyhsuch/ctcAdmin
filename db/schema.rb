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

ActiveRecord::Schema.define(version: 20161124082631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
    t.string   "password"
  end

  add_index "admin_users", ["name"], name: "index_admin_users_on_name", unique: true, using: :btree

  create_table "progresses", force: :cascade do |t|
    t.integer  "users_id"
    t.integer  "topics_id"
    t.integer  "question_id"
    t.integer  "lives"
    t.integer  "level"
    t.datetime "created_at",  default: "now()", null: false
    t.datetime "updated_at",  default: "now()", null: false
  end

  add_index "progresses", ["topics_id"], name: "index_progresses_on_topics_id", using: :btree
  add_index "progresses", ["users_id"], name: "index_progresses_on_users_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.string   "choice_A"
    t.string   "choice_B"
    t.string   "choice_C"
    t.string   "choice_D"
    t.string   "answer"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.integer  "tower_id"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
  end

  create_table "towers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.string   "password_digest"
    t.string   "nationality"
    t.date     "date_of_birth"
    t.integer  "contact_number"
    t.string   "email"
    t.datetime "created_at",      default: "now()", null: false
    t.datetime "updated_at",      default: "now()", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.integer  "difficulty"
    t.integer  "topic_id"
    t.datetime "created_at", default: "now()", null: false
    t.datetime "updated_at", default: "now()", null: false
  end

  create_table "zones_questions", id: false, force: :cascade do |t|
    t.integer  "zone_id"
    t.integer  "question_id"
    t.datetime "created_at",  default: "now()", null: false
    t.datetime "updated_at",  default: "now()", null: false
  end

  add_index "zones_questions", ["question_id"], name: "index_zones_questions_on_question_id", using: :btree
  add_index "zones_questions", ["zone_id"], name: "index_zones_questions_on_zone_id", using: :btree

  add_foreign_key "topics", "towers"
  add_foreign_key "zones", "topics"
end
