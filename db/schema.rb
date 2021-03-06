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

ActiveRecord::Schema.define(version: 2019_03_19_041139) do

  create_table "items", force: :cascade do |t|
    t.integer "list_id"
    t.string "name"
    t.string "url"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.integer "user_id"
    t.integer "list_id"
    t.integer "source_id"
    t.datetime "acknowledgment"
    t.string "pln_num"
    t.string "fuel"
    t.string "fl"
    t.string "msg"
    t.date "date"
    t.time "etd"
    t.string "send_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.integer "col1"
    t.integer "col2"
    t.date "col3"
    t.string "col4"
    t.string "col5"
    t.string "col6"
    t.string "col7"
    t.time "col8"
    t.time "col9"
    t.string "col10"
    t.string "col11"
    t.string "col12"
    t.integer "col13"
    t.integer "col14"
    t.integer "col15"
    t.integer "col16"
    t.integer "col17"
    t.integer "col18"
    t.integer "col19"
    t.integer "col20"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upload_files", force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "belongs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
