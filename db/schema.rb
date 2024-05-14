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

ActiveRecord::Schema[7.1].define(version: 2024_05_14_195135) do
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
    t.integer "buffet_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment", default: 0
    t.index ["buffet_profile_id"], name: "index_buffets_on_buffet_profile_id"
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
    t.integer "max_people"
    t.integer "duration"
    t.text "menu"
    t.string "address"
    t.integer "alcoholic_drink", default: 0
    t.integer "decoration", default: 0
    t.integer "parking", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "buffet_id", null: false
    t.integer "venue_preference", default: 0
    t.integer "base_price", default: 0
    t.integer "additional_per_person", default: 0
    t.integer "value_extra_hour", default: 0
    t.integer "base_price_weekend", default: 0
    t.integer "additional_per_person_weekend", default: 0
    t.integer "value_extra_hour_weekend", default: 0
    t.index ["buffet_id"], name: "index_events_on_buffet_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "buffet_id", null: false
    t.integer "event_id", null: false
    t.integer "client_id", null: false
    t.date "event_day"
    t.integer "amount_people"
    t.text "details"
    t.string "code"
    t.string "venue"
    t.string "status", default: "Aguardando avaliação do buffet"
    t.date "order_vality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discount", default: 0
    t.integer "surcharge", default: 0
    t.integer "total_value", default: 0
    t.text "discount_description"
    t.text "surcharge_description"
    t.integer "extra_hour", default: 0
    t.integer "payment", default: 0
    t.index ["buffet_id"], name: "index_orders_on_buffet_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["event_id"], name: "index_orders_on_event_id"
  end

  add_foreign_key "buffets", "buffet_profiles"
  add_foreign_key "events", "buffets"
  add_foreign_key "orders", "buffets"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "events"
end
