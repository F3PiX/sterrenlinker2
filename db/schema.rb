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

ActiveRecord::Schema.define(version: 20170407142756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "link_requests", force: :cascade do |t|
    t.string   "researcher"
    t.string   "research_proposal"
    t.string   "patient_org"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "researcher_email"
    t.string   "research_org"
    t.string   "fonds"
    t.datetime "application_date"
    t.datetime "sterrenlink_sent_at"
  end

  create_table "sterrenlinks", force: :cascade do |t|
    t.string   "output_link"
    t.integer  "link_request_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["link_request_id"], name: "index_sterrenlinks_on_link_request_id", using: :btree
  end

  add_foreign_key "sterrenlinks", "link_requests"
end
