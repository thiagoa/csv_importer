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

ActiveRecord::Schema.define(version: 20161113220245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "real_estate_transactions", force: :cascade do |t|
    t.string   "street",    default: "",    null: false
    t.string   "city",      default: "",    null: false
    t.string   "zip",       default: "",    null: false
    t.string   "state",     default: "",    null: false
    t.integer  "beds",      default: 0,     null: false
    t.integer  "baths",     default: 0,     null: false
    t.string   "type",      default: "",    null: false
    t.integer  "sq_ft",     default: 0,     null: false
    t.datetime "sale_date"
    t.integer  "price",     default: 0,     null: false
    t.decimal  "latitude",  default: "0.0", null: false
    t.decimal  "longitude", default: "0.0", null: false
  end

end
