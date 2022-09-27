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

ActiveRecord::Schema.define(version: 2022_09_26_224444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auditoria", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "total_amount", precision: 10, scale: 2
    t.bigint "order_id", null: false
    t.bigint "ticket_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["ticket_type_id"], name: "index_line_items_on_ticket_type_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "length"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.decimal "total_amount", precision: 10, scale: 2
    t.bigint "showtime_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "credit_card_number"
    t.string "expiration_date"
    t.index ["email"], name: "index_orders_on_email"
    t.index ["showtime_id"], name: "index_orders_on_showtime_id"
  end

  create_table "showtimes", force: :cascade do |t|
    t.datetime "start_time"
    t.integer "availability"
    t.bigint "movie_id", null: false
    t.bigint "auditorium_id", null: false
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auditorium_id"], name: "index_showtimes_on_auditorium_id"
    t.index ["movie_id"], name: "index_showtimes_on_movie_id"
    t.index ["start_time"], name: "index_showtimes_on_start_time"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string "ticket_type"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "ticket_types"
  add_foreign_key "orders", "showtimes"
  add_foreign_key "showtimes", "auditoria"
  add_foreign_key "showtimes", "movies"
end
