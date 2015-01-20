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

ActiveRecord::Schema.define(version: 20150119154037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "categories_causes", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "cause_id"
  end

  add_index "categories_causes", ["category_id", "cause_id"], name: "by_category_and_cause", unique: true, using: :btree
  add_index "categories_causes", ["cause_id", "category_id"], name: "by_cause_and_category", unique: true, using: :btree

  create_table "keywords", force: true do |t|
    t.string  "name"
    t.string  "cn_category"
    t.integer "cn_category_id"
    t.integer "cn_id"
    t.text    "cn_description"
    t.string  "type"
    t.string  "stem"
  end

  create_table "keywords_organizations", id: false, force: true do |t|
    t.integer "organization_id"
    t.integer "keyword_id"
  end

  create_table "organizations", force: true do |t|
    t.string  "name"
    t.integer "ein"
    t.integer "cn_overall_rating"
    t.integer "cn_overall_score"
    t.boolean "cn_donor_advisory"
    t.integer "cn_id"
    t.hstore  "cn_data"
    t.string  "type"
  end

end
