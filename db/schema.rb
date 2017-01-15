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

ActiveRecord::Schema.define(version: 20170115150236) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "description",             limit: 65535
    t.string   "meta_desc"
    t.string   "meta_key"
    t.string   "meta_title"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
  end

  create_table "category_slide_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["category_id"], name: "index_category_slide_images_on_category_id", using: :btree
  end

  create_table "product_slide_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["product_id"], name: "index_product_slide_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "size"
    t.integer  "price"
    t.text     "quality",                 limit: 65535
    t.integer  "category_id"
    t.integer  "twocategory_id"
    t.integer  "threecategory_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "meta_desc"
    t.string   "meta_key"
    t.string   "meta_title"
    t.text     "description",             limit: 65535
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "name"
    t.string   "article"
    t.integer  "moderation",                            default: 0
    t.integer  "visible"
    t.integer  "seller_id"
  end

  create_table "rootadmins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_rootadmins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_rootadmins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "sellers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "surname"
    t.datetime "date_of_birth"
    t.string   "city"
    t.string   "promo_code"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "moderation",             default: 0
    t.integer  "reset_session",          default: 1
    t.index ["email"], name: "index_sellers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "threecategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "twocategory_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "description",    limit: 65535
    t.string   "meta_desc"
    t.string   "meta_key"
    t.string   "meta_title"
    t.index ["twocategory_id"], name: "index_threecategories_on_twocategory_id", using: :btree
  end

  create_table "twocategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.text     "description",        limit: 65535
    t.string   "meta_desc"
    t.string   "meta_key"
    t.string   "meta_title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["category_id"], name: "index_twocategories_on_category_id", using: :btree
  end

  add_foreign_key "category_slide_images", "categories"
  add_foreign_key "product_slide_images", "products"
  add_foreign_key "threecategories", "twocategories"
  add_foreign_key "twocategories", "categories"
end
