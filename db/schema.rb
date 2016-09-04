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

ActiveRecord::Schema.define(version: 20160904130850) do

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "fio"
    t.string   "name"
    t.string   "descriprion"
    t.decimal  "money_from",   precision: 10
    t.decimal  "money_to",     precision: 10
    t.string   "location"
    t.string   "category"
    t.string   "expectations"
    t.string   "skype"
    t.string   "site"
    t.string   "linkedin"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "photo"
    t.string   "cv"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "email_confirmed"
    t.string   "confirm_token"
  end

end
