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

ActiveRecord::Schema.define(version: 2021_06_04_210008) do

  create_table "availabilities", force: :cascade do |t|
    t.integer "domain_id", null: false
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["domain_id"], name: "index_availabilities_on_domain_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "label"
    t.integer "tld_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tld_id", "label"], name: "index_domains_on_tld_id_and_label", unique: true
    t.index ["tld_id"], name: "index_domains_on_tld_id"
  end

  create_table "hacks", force: :cascade do |t|
    t.integer "domain_id", null: false
    t.integer "phrase_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["domain_id", "phrase_id"], name: "index_hacks_on_domain_id_and_phrase_id", unique: true
    t.index ["domain_id"], name: "index_hacks_on_domain_id"
    t.index ["phrase_id"], name: "index_hacks_on_phrase_id"
  end

  create_table "phrases", force: :cascade do |t|
    t.string "text"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text"], name: "index_phrases_on_text", unique: true
  end

  create_table "tlds", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["label"], name: "index_tlds_on_label", unique: true
  end

  add_foreign_key "availabilities", "domains"
  add_foreign_key "domains", "tlds"
  add_foreign_key "hacks", "domains"
  add_foreign_key "hacks", "phrases"
end
