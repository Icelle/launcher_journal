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

ActiveRecord::Schema.define(version: 20131222200901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entry_categories", force: true do |t|
    t.integer  "journal_entry_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entry_categories", ["category_id"], name: "index_entry_categories_on_category_id", using: :btree
  add_index "entry_categories", ["journal_entry_id", "category_id"], name: "index_entry_categories_on_journal_entry_id_and_category_id", unique: true, using: :btree
  add_index "entry_categories", ["journal_entry_id"], name: "index_entry_categories_on_journal_entry_id", using: :btree

  create_table "journal_entries", force: true do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
