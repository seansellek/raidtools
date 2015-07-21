# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150721055025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string  "region",   null: false
    t.string  "server",   null: false
    t.string  "name",     null: false
    t.integer "realm_id"
  end

  add_index "characters", ["realm_id"], name: "index_characters_on_realm_id", using: :btree

  create_table "realms", force: :cascade do |t|
    t.string  "name"
    t.string  "slug"
    t.integer "region_id"
  end

  add_index "realms", ["name"], name: "index_realms_on_name", using: :btree
  add_index "realms", ["region_id"], name: "index_realms_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "characters", "realms"
  add_foreign_key "realms", "regions"
end
