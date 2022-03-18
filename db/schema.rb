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

ActiveRecord::Schema.define(version: 2022_03_18_161844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemon_stats", force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.bigint "stat_id", null: false
    t.integer "effort"
    t.integer "base_stat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_pokemon_stats_on_pokemon_id"
    t.index ["stat_id"], name: "index_pokemon_stats_on_stat_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "base_experience"
    t.integer "height"
    t.integer "weight"
    t.boolean "is_default"
    t.integer "order"
    t.integer "api_id"
    t.string "species_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "front_default"
    t.string "front_shiny"
    t.string "official_artwork"
    t.string "type_1"
    t.string "type_2"
    t.string "front_female"
    t.string "front_shiny_female"
    t.string "back_default"
    t.string "back_female"
    t.string "back_shiny"
    t.string "back_shiny_female"
    t.string "home_front_default"
    t.string "home_front_female"
    t.string "home_front_shiny"
    t.string "home_front_shiny_female"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.integer "base_happiness"
    t.integer "capture_rate"
    t.boolean "forms_switchable"
    t.integer "gender_rate"
    t.boolean "has_gender_differences"
    t.integer "hatch_counter"
    t.integer "api_id"
    t.boolean "is_baby"
    t.boolean "is_legendary"
    t.boolean "is_mythical"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stats", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.text "double_damage_from", default: [], array: true
    t.text "double_damage_to", default: [], array: true
    t.text "half_damage_from", default: [], array: true
    t.text "half_damage_to", default: [], array: true
    t.text "no_damage_from", default: [], array: true
    t.text "no_damage_to", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pokemon_stats", "pokemons"
  add_foreign_key "pokemon_stats", "stats"
end
