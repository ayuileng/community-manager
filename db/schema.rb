# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_11_20_055051) do
  create_table "buildings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "building_no", null: false
    t.integer "total_floor", null: false
    t.text "excluded_floor", default: "[]", null: false
    t.integer "units_per_floor", null: false
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_no"], name: "index_buildings_on_building_no", unique: true
    t.index ["user_id"], name: "index_buildings_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "building_id", null: false
    t.integer "visit_schedule_id"
    t.string "unit_no", null: false
    t.integer "floor", null: false
    t.integer "unit_index", null: false
    t.boolean "active", default: true, null: false
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id", "floor"], name: "index_units_on_building_id_and_floor"
    t.index ["building_id", "unit_no"], name: "index_units_on_building_id_and_unit_no", unique: true
    t.index ["building_id"], name: "index_units_on_building_id"
    t.index ["visit_schedule_id"], name: "index_units_on_visit_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone"
    t.integer "role"
    t.integer "{null: false, default: 0}"
    t.string "password_digest", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visit_logs", force: :cascade do |t|
    t.integer "unit_id", null: false
    t.integer "visit_period_id", null: false
    t.integer "user_id", null: false
    t.datetime "visited_at", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id", "visited_at"], name: "index_visit_logs_on_unit_id_and_visited_at"
    t.index ["unit_id"], name: "index_visit_logs_on_unit_id"
    t.index ["user_id"], name: "index_visit_logs_on_user_id"
    t.index ["visit_period_id"], name: "index_visit_logs_on_visit_period_id"
    t.index ["visited_at"], name: "index_visit_logs_on_visited_at"
  end

  create_table "visit_periods", force: :cascade do |t|
    t.integer "unit_id", null: false
    t.integer "visit_schedule_id", null: false
    t.date "period_start", null: false
    t.date "period_end", null: false
    t.date "due_at", null: false
    t.integer "required_count", null: false
    t.integer "completed_count", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.integer "remind_days_before", null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["period_end"], name: "index_visit_periods_on_period_end"
    t.index ["period_start"], name: "index_visit_periods_on_period_start"
    t.index ["status", "due_at"], name: "index_visit_periods_on_status_and_due_at"
    t.index ["unit_id", "period_start"], name: "index_visit_periods_on_unit_id_and_period_start", unique: true
    t.index ["unit_id"], name: "index_visit_periods_on_unit_id"
    t.index ["visit_schedule_id"], name: "index_visit_periods_on_visit_schedule_id"
  end

  create_table "visit_schedules", force: :cascade do |t|
    t.string "name", null: false
    t.integer "period_unit", null: false
    t.integer "times_per_period", null: false
    t.integer "remind_days_before", null: false
    t.text "description"
    t.boolean "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_visit_schedules_on_name", unique: true
  end

  add_foreign_key "buildings", "users"
  add_foreign_key "units", "buildings"
  add_foreign_key "units", "visit_schedules"
  add_foreign_key "visit_logs", "units"
  add_foreign_key "visit_logs", "users"
  add_foreign_key "visit_logs", "visit_periods"
  add_foreign_key "visit_periods", "units"
  add_foreign_key "visit_periods", "visit_schedules"
end
