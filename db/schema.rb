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

ActiveRecord::Schema.define(version: 2019_11_15_222353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offenders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name", null: false
    t.string "vehicle_no", null: false
    t.string "statement"
    t.string "driver_liences_no"
    t.string "email"
    t.string "vehicle_type"
    t.datetime "date_of_issue"
    t.string "city_town"
    t.string "address"
    t.string "number_of_poeple"
    t.string "phone_number", null: false
    t.boolean "ambolance_needed", default: false
    t.boolean "injured_people", default: false
    t.boolean "toll_track_needed", default: false
    t.index ["phone_number"], name: "index_offenders_on_phone_number"
  end

  create_table "offenders_offenses", id: false, force: :cascade do |t|
    t.bigint "offender_id", null: false
    t.bigint "offense_id", null: false
    t.index ["offender_id", "offense_id"], name: "index_offenders_offenses_on_offender_id_and_offense_id"
    t.index ["offense_id", "offender_id"], name: "index_offenders_offenses_on_offense_id_and_offender_id"
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
    t.string "city_town"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "designation"
    t.string "address"
    t.string "registered_no"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["region_id"], name: "index_users_on_region_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

end
