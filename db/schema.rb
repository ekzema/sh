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

ActiveRecord::Schema.define(version: 20160906202402) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",             limit: 65535
    t.string   "meta_desc"
    t.string   "meta_key"
    t.string   "meta_title"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
  end

  create_table "threecategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "twocategory_id"
    t.text     "description",    limit: 65535
    t.string   "meta_desc"
    t.string   "meta_key"
    t.string   "meta_title"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["twocategory_id"], name: "index_threecategories_on_twocategory_id", using: :btree
  end

  create_table "twocategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category_id"
    t.text     "description", limit: 65535
    t.string   "meta_desc"
    t.string   "meta_key"
    t.string   "meta_title"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "index_twocategories_on_category_id", using: :btree
  end

  add_foreign_key "threecategories", "twocategories"
  add_foreign_key "twocategories", "categories"
end
