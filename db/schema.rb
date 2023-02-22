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

ActiveRecord::Schema[7.0].define(version: 2023_02_21_014615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fields", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "status"
    t.text "coordinates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fields_on_user_id"
  end

  create_table "parties", force: :cascade do |t|
    t.integer "creator"
    t.bigint "search_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["search_id"], name: "index_parties_on_search_id"
  end

  create_table "search_to_fields", force: :cascade do |t|
    t.bigint "search_id", null: false
    t.bigint "field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_search_to_fields_on_field_id"
    t.index ["search_id"], name: "index_search_to_fields_on_search_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.bigint "user_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "user_to_parties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "party_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_user_to_parties_on_party_id"
    t.index ["user_id"], name: "index_user_to_parties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.boolean "status"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fields", "users"
  add_foreign_key "parties", "searches"
  add_foreign_key "search_to_fields", "fields"
  add_foreign_key "search_to_fields", "searches"
  add_foreign_key "searches", "users"
  add_foreign_key "user_to_parties", "parties"
  add_foreign_key "user_to_parties", "users"
end
