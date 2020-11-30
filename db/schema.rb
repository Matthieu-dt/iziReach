# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_30_093954) do

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

  create_table "bookings", force: :cascade do |t|
    t.bigint "influencer_id", null: false
    t.bigint "campaign_id", null: false
    t.string "status", default: "pending"
    t.text "contract"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_bookings_on_campaign_id"
    t.index ["influencer_id"], name: "index_bookings_on_influencer_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.text "description"
    t.string "target"
    t.datetime "occurs_at"
    t.string "status", default: "pending"
    t.integer "number_of_stories"
    t.integer "number_of_photos"
    t.integer "number_of_videos"
    t.integer "number_of_lives"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "lifestyle"
    t.boolean "sport"
    t.boolean "food"
    t.boolean "gaming"
    t.boolean "healthy"
    t.boolean "travel"
    t.boolean "music"
    t.boolean "fashion"
    t.boolean "art"
    t.boolean "technology"
    t.boolean "humour"
    t.boolean "beauty"
    t.index ["company_id"], name: "index_campaigns_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.text "values"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "influencers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.text "description"
    t.integer "price_per_story"
    t.integer "price_per_photo"
    t.integer "price_per_video"
    t.integer "price_per_live"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rating"
    t.string "fullname"
    t.string "followers"
    t.string "engagement"
    t.string "instagram_pp"
    t.boolean "lifestyle"
    t.boolean "sport"
    t.boolean "food"
    t.boolean "gaming"
    t.boolean "healthy"
    t.boolean "travel"
    t.boolean "music"
    t.boolean "fashion"
    t.boolean "art"
    t.boolean "technology"
    t.boolean "humour"
    t.boolean "beauty"
    t.index ["user_id"], name: "index_influencers_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "campaigns"
  add_foreign_key "bookings", "influencers"
  add_foreign_key "campaigns", "companies"
  add_foreign_key "companies", "users"
  add_foreign_key "influencers", "users"
  add_foreign_key "reviews", "bookings"
end
