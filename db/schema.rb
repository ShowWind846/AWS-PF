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

ActiveRecord::Schema.define(version: 2021_05_16_131431) do

  create_table "corps", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "introduction", default: "よろしくお願いします。"
    t.string "profile_image_id"
    t.string "hospital"
    t.string "last_name"
    t.string "first_name"
    t.integer "area", default: 0, null: false
    t.index ["email"], name: "index_corps_on_email", unique: true
    t.index ["reset_password_token"], name: "index_corps_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "corp_id"
    t.integer "room_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corp_id"], name: "index_messages_on_corp_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id"
    t.integer "visited_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked", default: false, null: false
    t.integer "visited_corp_id"
    t.integer "visitor_user_id"
    t.string "action"
    t.integer "message_id"
    t.integer "room_id"
    t.index ["message_id"], name: "index_notifications_on_message_id"
    t.index ["room_id"], name: "index_notifications_on_room_id"
    t.index ["visited_corp_id"], name: "index_notifications_on_visited_corp_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
    t.index ["visitor_user_id"], name: "index_notifications_on_visitor_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "contents"
    t.integer "category", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "post_image_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "corp_id"
    t.index ["corp_id"], name: "index_relationships_on_corp_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "relationship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationship_id"], name: "index_rooms_on_relationship_id"
  end

  create_table "suggests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "profile_image_id"
    t.text "introduction", default: "よろしくお願いします。"
    t.string "company"
    t.integer "area", default: 0, null: false
    t.integer "work_history", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
