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

ActiveRecord::Schema.define(version: 20160115211004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author"
    t.string   "chamber"
    t.boolean  "public",     default: true
    t.boolean  "published"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published",   default: true
    t.boolean  "public",      default: true
    t.string   "author"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "book_id"
    t.string   "description"
  end

  add_index "chapters", ["book_id"], name: "index_chapters_on_book_id", using: :btree

  create_table "tableofcontents", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "body"
    t.boolean  "public",      default: true
    t.string   "author"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "chapter_id"
    t.integer  "book_id"
  end

  add_index "tableofcontents", ["book_id"], name: "index_tableofcontents_on_book_id", using: :btree
  add_index "tableofcontents", ["chapter_id"], name: "index_tableofcontents_on_chapter_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end