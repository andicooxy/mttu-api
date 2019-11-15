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

ActiveRecord::Schema.define(version: 2019_11_15_125229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offenses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_offenses_on_user_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_regions_on_name"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "designation", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.string "full_name"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.boolean "is_active", default: true
    t.boolean "is_archived", default: false
    t.integer "pass_login_count", default: 0
    t.boolean "has_reset_password", default: false
    t.boolean "has_password_locked", default: false
    t.boolean "blocked", default: false
    t.integer "pas_login_count", default: 0
    t.datetime "last_password_reset_date"
    t.boolean "verified", default: false
    t.bigint "department_id"
    t.bigint "region_id"
    t.bigint "user_type_id"
    t.string "town"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "designation"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["region_id"], name: "index_users_on_region_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

end
