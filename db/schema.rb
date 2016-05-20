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

ActiveRecord::Schema.define(version: 20160113112229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_dashboard_translations", force: :cascade do |t|
    t.integer  "about_dashboard_id", null: false
    t.string   "locale",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "describe"
    t.text     "adress"
  end

  add_index "about_dashboard_translations", ["about_dashboard_id"], name: "index_about_dashboard_translations_on_about_dashboard_id", using: :btree
  add_index "about_dashboard_translations", ["locale"], name: "index_about_dashboard_translations_on_locale", using: :btree

  create_table "about_dashboards", force: :cascade do |t|
    t.text     "describe"
    t.text     "adress"
    t.string   "enquiries"
    t.string   "bidding"
    t.string   "facebook"
    t.string   "vimeo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "about_translations", force: :cascade do |t|
    t.integer  "about_id",     null: false
    t.string   "locale",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.text     "describe"
    t.string   "picture_name"
  end

  add_index "about_translations", ["about_id"], name: "index_about_translations_on_about_id", using: :btree
  add_index "about_translations", ["locale"], name: "index_about_translations_on_locale", using: :btree

  create_table "abouts", force: :cascade do |t|
    t.string   "picture"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "describe"
    t.string   "position"
    t.integer  "index",        default: 0
    t.boolean  "show",         default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "picture_name"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 2
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "award_skins", force: :cascade do |t|
    t.integer  "award_id"
    t.integer  "skin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "award_skins", ["award_id"], name: "index_award_skins_on_award_id", using: :btree
  add_index "award_skins", ["skin_id"], name: "index_award_skins_on_skin_id", using: :btree

  create_table "awards", force: :cascade do |t|
    t.string   "name"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "casting_dashboard_translations", force: :cascade do |t|
    t.integer  "casting_dashboard_id", null: false
    t.string   "locale",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "describe"
  end

  add_index "casting_dashboard_translations", ["casting_dashboard_id"], name: "index_casting_dashboard_translations_on_casting_dashboard_id", using: :btree
  add_index "casting_dashboard_translations", ["locale"], name: "index_casting_dashboard_translations_on_locale", using: :btree

  create_table "casting_dashboards", force: :cascade do |t|
    t.text     "describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "castings", force: :cascade do |t|
    t.string   "picture"
    t.integer  "people_type", default: 0
    t.integer  "index",       default: 0
    t.boolean  "show",        default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "index",      default: 0
    t.boolean  "show"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id", using: :btree
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale", using: :btree

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

  create_table "client_dashboard_translations", force: :cascade do |t|
    t.integer  "client_dashboard_id", null: false
    t.string   "locale",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "footer"
  end

  add_index "client_dashboard_translations", ["client_dashboard_id"], name: "index_client_dashboard_translations_on_client_dashboard_id", using: :btree
  add_index "client_dashboard_translations", ["locale"], name: "index_client_dashboard_translations_on_locale", using: :btree

  create_table "client_dashboards", force: :cascade do |t|
    t.text     "footer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_translations", force: :cascade do |t|
    t.integer  "client_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "client_translations", ["client_id"], name: "index_client_translations_on_client_id", using: :btree
  add_index "client_translations", ["locale"], name: "index_client_translations_on_locale", using: :btree

  create_table "clients", force: :cascade do |t|
    t.integer  "client_dashboard_id"
    t.string   "picture"
    t.string   "name"
    t.integer  "index",               default: 0
    t.boolean  "show",                default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "clients", ["client_dashboard_id"], name: "index_clients_on_client_dashboard_id", using: :btree

  create_table "location_dashboard_translations", force: :cascade do |t|
    t.integer  "location_dashboard_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "describe"
  end

  add_index "location_dashboard_translations", ["locale"], name: "index_location_dashboard_translations_on_locale", using: :btree
  add_index "location_dashboard_translations", ["location_dashboard_id"], name: "index_location_dashboard_translations_on_location_dashboard_id", using: :btree

  create_table "location_dashboards", force: :cascade do |t|
    t.text     "describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_pictures", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "picture"
    t.integer  "index",       default: 0
    t.boolean  "show",        default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "location_pictures", ["location_id"], name: "index_location_pictures_on_location_id", using: :btree

  create_table "location_translations", force: :cascade do |t|
    t.integer  "location_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "location_translations", ["locale"], name: "index_location_translations_on_locale", using: :btree
  add_index "location_translations", ["location_id"], name: "index_location_translations_on_location_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "index",      default: 0
    t.boolean  "show",       default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "skin_translations", force: :cascade do |t|
    t.integer  "skin_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "client"
    t.string   "brand"
    t.string   "video"
  end

  add_index "skin_translations", ["locale"], name: "index_skin_translations_on_locale", using: :btree
  add_index "skin_translations", ["skin_id"], name: "index_skin_translations_on_skin_id", using: :btree

  create_table "skins", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.string   "client"
    t.string   "brand"
    t.string   "video"
    t.string   "picture"
    t.integer  "index",       default: 0
    t.integer  "width",       default: 0
    t.integer  "height",      default: 0
    t.boolean  "show",        default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "team_id"
  end

  add_index "skins", ["category_id"], name: "index_skins_on_category_id", using: :btree
  add_index "skins", ["team_id"], name: "index_skins_on_team_id", using: :btree

  create_table "team_translations", force: :cascade do |t|
    t.integer  "team_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "director"
    t.string   "operator"
  end

  add_index "team_translations", ["locale"], name: "index_team_translations_on_locale", using: :btree
  add_index "team_translations", ["team_id"], name: "index_team_translations_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "director"
    t.string   "operator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_changes", force: :cascade do |t|
    t.integer  "admin_user_id"
    t.integer  "tableedit_id"
    t.string   "tableedit_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_changes", ["admin_user_id"], name: "index_user_changes_on_admin_user_id", using: :btree
  add_index "user_changes", ["tableedit_type", "tableedit_id"], name: "index_user_changes_on_tableedit_type_and_tableedit_id", using: :btree

end
