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

ActiveRecord::Schema.define(version: 2021_02_25_235605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.integer "AuthorId"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["AuthorId"], name: "index_comments_on_AuthorId"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "discussions", force: :cascade do |t|
    t.string "text"
    t.integer "AuthorId"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["AuthorId", "group_id"], name: "index_discussions_on_AuthorId_and_group_id"
    t.index ["AuthorId"], name: "index_discussions_on_AuthorId"
    t.index ["group_id"], name: "index_discussions_on_group_id"
  end

  create_table "group_registrations", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_registrations_on_group_id"
    t.index ["member_id", "group_id"], name: "index_group_registrations_on_member_id_and_group_id"
    t.index ["member_id"], name: "index_group_registrations_on_member_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_name", null: false
    t.string "group_description"
    t.integer "creator_id", null: false
    t.string "cover_image", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_groups_on_creator_id"
    t.index ["group_name"], name: "index_groups_on_group_name", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "text"
    t.integer "AuthorId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["AuthorId"], name: "index_posts_on_AuthorId"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "fullname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "photo", default: "", null: false
    t.string "coverimage", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
