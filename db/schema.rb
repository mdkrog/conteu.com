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

ActiveRecord::Schema.define(version: 20180628153753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "components", force: :cascade do |t|
    t.string   "type",       null: false
    t.integer  "story_id",   null: false
    t.integer  "order"
    t.text     "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_photos", force: :cascade do |t|
    t.string   "image",                   null: false
    t.text     "description"
    t.integer  "order",       default: 0
    t.integer  "event_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["event_id"], name: "index_event_photos_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",                       null: false
    t.date     "date"
    t.text     "description"
    t.boolean  "published",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "cover_image"
  end

  create_table "friend_products", force: :cascade do |t|
    t.string   "title",                        null: false
    t.text     "description"
    t.string   "image"
    t.string   "price"
    t.string   "partner_link"
    t.boolean  "displayed",    default: false
    t.integer  "sort_order",   default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "partner_name"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title",                           null: false
    t.string   "issue_number",                    null: false
    t.boolean  "published",       default: false
    t.date     "release_date"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "blurb"
    t.string   "cover_thumbnail"
    t.string   "cover_left"
    t.string   "cover_right"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name",                 default: "", null: false
    t.string   "email",                default: "", null: false
    t.string   "phone",                default: "", null: false
    t.string   "address",              default: "", null: false
    t.string   "city",                 default: "", null: false
    t.string   "postal_code",          default: "", null: false
    t.string   "country",              default: "", null: false
    t.string   "order_number"
    t.integer  "status",               default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "shipping_option",      default: 0
    t.integer  "fixed_shipping_price", default: -1
    t.index ["email"], name: "index_orders_on_email", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",                                                      null: false
    t.text     "description"
    t.integer  "price",                                 default: 0
    t.string   "image"
    t.boolean  "native_store",                          default: true
    t.integer  "quantity",                              default: 1
    t.string   "partner_name"
    t.string   "partner_link"
    t.boolean  "featured",                              default: false
    t.boolean  "displayed",                             default: false
    t.integer  "sort_order",                            default: 1
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "image_store_front"
    t.string   "image_alt1"
    t.boolean  "deleted",                               default: false
    t.integer  "local_shipping_price",                  default: 54
    t.string   "local_estimated_delivery_time",         default: "2 Days"
    t.integer  "international_shipping_price",          default: 250
    t.string   "international_estimated_delivery_time", default: "3 Months"
    t.boolean  "preorder",                              default: false
    t.date     "preorder_dispatch_date"
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title",                            null: false
    t.integer  "issue_id",                         null: false
    t.integer  "author_id"
    t.string   "slug"
    t.integer  "page_number"
    t.integer  "contents_layout"
    t.text     "contents_page_blurb"
    t.string   "contents_page_image"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "words_by",            default: ""
    t.string   "images_by",           default: ""
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  create_table "view_point_artists", force: :cascade do |t|
    t.integer  "view_point_object_id",                 null: false
    t.string   "artwork"
    t.text     "description"
    t.string   "artist_name"
    t.string   "artist_website"
    t.string   "artist_instagram"
    t.date     "showcase_date"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "trivia"
    t.boolean  "landscape",            default: false
    t.index ["view_point_object_id"], name: "index_view_point_artists_on_view_point_object_id", using: :btree
  end

  create_table "view_point_objects", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "displayed",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "sort_order", default: 0
  end

end
