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

ActiveRecord::Schema.define(version: 20180723213848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "spells", force: :cascade do |t|
    t.text "name"
    t.text "desc"
    t.text "higher"
    t.text "page"
    t.text "range"
    t.text "components"
    t.text "material"
    t.boolean "ritual"
    t.text "duration"
    t.boolean "concentration"
    t.text "casting_time"
    t.integer "level"
    t.text "school"
    t.text "classes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
