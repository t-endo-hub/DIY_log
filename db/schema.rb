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

ActiveRecord::Schema.define(version: 2020_09_11_011947) do

  create_table "comments", force: :cascade do |t|
    t.text "comment", null: false
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "address"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "post_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_items_on_post_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.integer "post_id", null: false
    t.string "name", null: false
    t.string "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_materials_on_post_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id"
    t.integer "visited_id"
    t.integer "post_id"
    t.integer "comment_id"
    t.string "action"
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.string "name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.integer "payment", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_orders_on_post_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "content"
    t.string "image_id", null: false
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "post_id", null: false
    t.string "image_id"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_recipes_on_post_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
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
    t.string "name", default: "", null: false
    t.text "discription"
    t.string "address"
    t.string "posta_code"
    t.string "image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
