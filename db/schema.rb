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

ActiveRecord::Schema.define(version: 20160608184103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "body"
    t.boolean  "published"
    t.string   "image"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "article_image"
    t.string   "blogpicture"
    t.boolean  "hiring"
    t.boolean  "firing"
    t.boolean  "good_read"
    t.boolean  "holidays_vacations"
    t.boolean  "forms_policies"
    t.boolean  "leave_disability"
    t.boolean  "management"
    t.boolean  "performance"
    t.boolean  "safety_health"
    t.boolean  "wages"
    t.boolean  "webinars_events"
    t.boolean  "harrassment"
    t.string   "slug"
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author"
    t.string   "chamber"
    t.boolean  "public",      default: true
    t.boolean  "published"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "image"
    t.string   "avatar"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "youtube"
    t.string   "tumblr"
    t.string   "linkedin"
    t.string   "websiteurl"
    t.string   "websitename"
    t.string   "slug"
  end

  add_index "books", ["slug"], name: "index_books_on_slug", using: :btree

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
    t.integer  "weight"
    t.string   "slug"
  end

  add_index "chapters", ["book_id"], name: "index_chapters_on_book_id", using: :btree
  add_index "chapters", ["slug"], name: "index_chapters_on_slug", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "emails", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.boolean  "permissions", default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "tableofcontent_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "favorites", ["article_id"], name: "index_favorites_on_article_id", using: :btree
  add_index "favorites", ["tableofcontent_id"], name: "index_favorites_on_tableofcontent_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

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
    t.integer  "weight"
    t.binary   "text"
    t.string   "slug"
  end

  add_index "tableofcontents", ["book_id"], name: "index_tableofcontents_on_book_id", using: :btree
  add_index "tableofcontents", ["chapter_id"], name: "index_tableofcontents_on_chapter_id", using: :btree
  add_index "tableofcontents", ["slug"], name: "index_tableofcontents_on_slug", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "role"
    t.string   "avatar"
    t.boolean  "email_favorites",        default: true
    t.integer  "article_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "favorites", "articles"
  add_foreign_key "favorites", "tableofcontents"
  add_foreign_key "favorites", "users"
end
