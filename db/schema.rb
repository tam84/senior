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

ActiveRecord::Schema.define(version: 2018_08_19_121541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assetclasses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "assetclass_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "senter_id"
    t.integer "receiver_id"
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

  create_table "email_messages", force: :cascade do |t|
    t.text "subject"
    t.text "text_message"
    t.integer "product_id"
    t.integer "receiver_id"
    t.integer "senter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "email_message_id"
  end

  create_table "firms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "whatsapp"
    t.string "skype"
    t.string "linkedin"
    t.string "facebook"
    t.string "instagram"
    t.string "firm_phone"
    t.string "cnpj"
    t.string "website"
    t.string "address"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_answers", force: :cascade do |t|
    t.text "subject"
    t.text "text_message"
    t.integer "product_id"
    t.integer "receiver_id"
    t.integer "senter_id"
    t.integer "email_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "product_associates", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_specifics", force: :cascade do |t|
    t.integer "irr_from"
    t.integer "coc_from"
    t.integer "irr_to"
    t.integer "coc_to"
    t.integer "deal_size_from"
    t.integer "deal_size_to"
    t.integer "stake_offered_from"
    t.integer "stake_offered_to"
    t.integer "revenue_from"
    t.integer "revenue_to"
    t.integer "ebtida_from"
    t.integer "ebtida_to"
    t.string "closing_expected"
    t.integer "net_debt"
    t.integer "product_id"
    t.string "investment_structure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "management_firm"
    t.string "manager"
    t.string "administrator"
    t.string "destribuitor"
    t.string "cnpj"
    t.string "inception_date"
    t.string "minimal_investment"
    t.string "maximum_investment"
    t.string "target_investor"
    t.string "benchmark"
    t.integer "assetclass_id"
    t.integer "category_id"
    t.integer "firm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key_information"
    t.integer "performance_fee"
    t.integer "admin_fee"
    t.string "status"
    t.string "other_obs"
    t.integer "target_return_benchmark_from"
    t.integer "target_return_benchmark_to"
    t.string "country"
    t.integer "investment_period_from"
    t.integer "investment_period_to"
  end

  create_table "quotations", force: :cascade do |t|
    t.integer "senter_id"
    t.integer "receiver_id"
    t.string "quote"
    t.text "senter_message"
    t.text "receiver_message"
    t.integer "firm_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.text "description"
    t.bigint "whatsapp"
    t.string "skype"
    t.string "linkedin"
    t.string "facebook"
    t.string "instagram"
    t.string "firm_phone"
    t.string "official_registration"
    t.string "website"
    t.string "avatar"
    t.boolean "admin", default: false
    t.string "address"
    t.integer "firm_id"
    t.string "job_title"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chat_rooms", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
end
