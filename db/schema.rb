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

ActiveRecord::Schema.define(version: 2020_02_09_130039) do

  create_table "check_points", force: :cascade do |t|
    t.string "mode_id"
    t.string "start_point"
    t.string "end_point"
    t.decimal "dist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "healths", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "weight"
    t.decimal "metabolism"
    t.decimal "muscle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "fat_rate"
  end

  create_table "modes", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.integer "status"
    t.string "title"
    t.text "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "mode_id"
    t.string "custom_url"
    t.decimal "total_dist"
    t.decimal "total_cal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "dist"
    t.decimal "cal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
