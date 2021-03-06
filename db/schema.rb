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

ActiveRecord::Schema.define(version: 2021_07_18_055718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "list_invitations", force: :cascade do |t|
    t.uuid "list_id"
    t.string "name"
    t.citext "email", null: false
    t.boolean "accepted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id", "email"], name: "index_list_invitations_on_list_id_and_email", unique: true
    t.index ["list_id"], name: "index_list_invitations_on_list_id"
  end

  create_table "list_item_votes", force: :cascade do |t|
    t.bigint "list_item_id"
    t.bigint "voted_by_id"
    t.string "sign", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_item_id"], name: "index_list_item_votes_on_list_item_id"
    t.index ["sign"], name: "index_list_item_votes_on_sign"
    t.index ["voted_by_id"], name: "index_list_item_votes_on_voted_by_id"
  end

  create_table "list_items", force: :cascade do |t|
    t.uuid "list_id", null: false
    t.string "value", null: false
    t.boolean "checked", default: false
    t.bigint "last_checked_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["last_checked_by_id"], name: "index_list_items_on_last_checked_by_id"
    t.index ["list_id"], name: "index_list_items_on_list_id"
  end

  create_table "lists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.jsonb "configuration", default: {}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "permissions", default: 0, null: false
    t.integer "anon_permissions", default: 0, null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
