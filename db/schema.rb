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

ActiveRecord::Schema[7.1].define(version: 2024_04_25_180529) do
  create_table "buffet_profiles", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_buffet_profiles_on_email", unique: true
    t.index ["reset_password_token"], name: "index_buffet_profiles_on_reset_password_token", unique: true
  end

  create_table "buffets", force: :cascade do |t|
    t.string "brand_name"
    t.string "corporate_name"
    t.integer "registration_number"
    t.integer "phone"
    t.string "email"
    t.string "address"
    t.string "district"
    t.string "state"
    t.string "city"
    t.integer "zip_code"
    t.text "description"
    t.integer "payment_id", null: false
    t.integer "buffet_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id", null: false
    t.index ["buffet_profile_id"], name: "index_buffets_on_buffet_profile_id"
    t.index ["event_id"], name: "index_buffets_on_event_id"
    t.index ["payment_id"], name: "index_buffets_on_payment_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "cpf"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "min_people"
    t.integer "max_peaple"
    t.integer "duration"
    t.text "menu"
    t.string "address"
    t.string "alcoholic_drink"
    t.string "decoration"
    t.string "parking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buffets", "buffet_profiles"
  add_foreign_key "buffets", "events"
  add_foreign_key "buffets", "payments"
end
