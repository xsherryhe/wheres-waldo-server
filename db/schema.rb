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

ActiveRecord::Schema[7.0].define(version: 2023_01_24_230858) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_targets", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "target_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_targets_on_game_id"
    t.index ["target_id"], name: "index_game_targets_on_target_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "player"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "image_id", null: false
    t.integer "completion_time"
    t.index ["image_id"], name: "index_games_on_image_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "file"
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "targets", force: :cascade do |t|
    t.string "name"
    t.integer "row"
    t.integer "column"
    t.bigint "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
    t.index ["image_id"], name: "index_targets_on_image_id"
  end

  add_foreign_key "game_targets", "games"
  add_foreign_key "game_targets", "targets"
  add_foreign_key "games", "images"
  add_foreign_key "targets", "images"
end
