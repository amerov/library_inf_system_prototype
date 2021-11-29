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

ActiveRecord::Schema.define(version: 2021_11_28_233239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.bigint "lib_id", null: false
    t.string "position"
    t.date "birthdate"
    t.date "joined_at"
    t.string "education"
    t.integer "salary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lib_id"], name: "index_employees_on_lib_id"
  end

  create_table "foundations", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "lib_id", null: false
    t.integer "books_count", default: 0, null: false
    t.integer "journals_count", default: 0, null: false
    t.integer "newspapers_count", default: 0, null: false
    t.integer "collections_count", default: 0, null: false
    t.integer "dissertations_count", default: 0, null: false
    t.integer "reports_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lib_id"], name: "index_foundations_on_lib_id"
  end

  create_table "libs", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "replenishments", force: :cascade do |t|
    t.bigint "foundation_id", null: false
    t.bigint "employee_id", null: false
    t.string "name", null: false
    t.bigint "type_id", null: false
    t.string "publisher", null: false
    t.integer "items_count", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_replenishments_on_employee_id"
    t.index ["foundation_id"], name: "index_replenishments_on_foundation_id"
    t.index ["type_id"], name: "index_replenishments_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_types_on_name", unique: true
  end

  add_foreign_key "employees", "libs"
  add_foreign_key "foundations", "libs"
  add_foreign_key "replenishments", "employees"
  add_foreign_key "replenishments", "foundations"
  add_foreign_key "replenishments", "types"
end
