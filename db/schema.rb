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

ActiveRecord::Schema[7.0].define(version: 2022_07_16_134335) do
  create_table "executors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
  end

  create_table "order_services", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "executor_id"
    t.index ["executor_id"], name: "index_order_services_on_executor_id"
    t.index ["order_id"], name: "index_order_services_on_order_id"
    t.index ["service_id"], name: "index_order_services_on_service_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.string "customer_name"
  end

  create_table "service_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_category_id"
    t.decimal "price", precision: 8, scale: 2
    t.integer "exec_time"
    t.index ["service_category_id"], name: "index_services_on_service_category_id"
  end

  add_foreign_key "order_services", "executors"
  add_foreign_key "order_services", "orders"
  add_foreign_key "order_services", "services"
  add_foreign_key "services", "service_categories"
end
