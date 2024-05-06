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

ActiveRecord::Schema[7.1].define(version: 2024_05_22_111040) do
  create_table "categories", primary_key: "category_id", id: :string, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "parent_id"
    t.string "use_yn"
    t.string "register_id"
    t.string "updater_id"
    t.datetime "create_at"
    t.datetime "update_at"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "products", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "state"
    t.string "category_id"
    t.string "company"
    t.string "origin"
    t.integer "margin_rate"
    t.string "tax_yn"
    t.string "introduce_img_src"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "products_image", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "product_id"
    t.string "src"
    t.string "use_yn"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "products_option", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "product_id"
    t.string "option_name"
    t.string "use_yn"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "products_option_kind", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "product_id"
    t.string "type"
    t.string "name"
    t.string "use_yn"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "products_price", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "product_id"
    t.integer "price"
    t.integer "wonga"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "products_stock", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "product_option_id"
    t.integer "plus_price"
    t.integer "quantity"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "users", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
