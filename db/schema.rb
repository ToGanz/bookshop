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

ActiveRecord::Schema.define(version: 2021_04_25_041126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_authors_on_name", unique: true
  end

  create_table "authorships", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_authorships_on_author_id"
    t.index ["book_id", "author_id"], name: "index_authorships_on_book_id_and_author_id", unique: true
    t.index ["book_id"], name: "index_authorships_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price_cents", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_books_on_name", unique: true
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "book_id", null: false
    t.integer "quantity", null: false
    t.integer "each_price_cents", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_line_items_on_book_id"
    t.index ["order_id", "book_id"], name: "index_line_items_on_order_id_and_book_id", unique: true
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "authorships", "authors"
  add_foreign_key "authorships", "books"
  add_foreign_key "line_items", "books"
  add_foreign_key "line_items", "orders"
end
