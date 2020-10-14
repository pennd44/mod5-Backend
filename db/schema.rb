# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_14_004943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_items", force: :cascade do |t|
    t.integer "price"
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "area_id", null: false
    t.index ["area_id"], name: "index_area_items_on_area_id"
    t.index ["item_id"], name: "index_area_items_on_item_id"
  end

  create_table "area_skills", force: :cascade do |t|
    t.bigint "area_id", null: false
    t.bigint "skill_id", null: false
    t.integer "current_health", default: 0
    t.integer "current_energy", default: 0
    t.integer "money", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_area_skills_on_area_id"
    t.index ["skill_id"], name: "index_area_skills_on_skill_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "quote"
    t.string "background"
    t.string "avatar"
    t.bigint "map_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "map_image"
    t.index ["map_id"], name: "index_areas_on_map_id"
  end

  create_table "enemies", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.integer "current_health", default: 1
    t.integer "max_health", default: 1
    t.integer "attack", default: 1
    t.integer "defense", default: 1
    t.integer "current_mp", default: 1
    t.integer "max_mp", default: 1
    t.integer "speed", default: 1
    t.integer "charm", default: 1
    t.integer "intelligence", default: 1
    t.integer "win_money", default: 0
    t.integer "loss_money", default: 0
    t.integer "win_xp", default: 0
    t.integer "loss_xp", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "job_id"
    t.index ["job_id"], name: "index_enemies_on_job_id"
  end

  create_table "enemy_items", force: :cascade do |t|
    t.boolean "equipped"
    t.bigint "enemy_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enemy_id"], name: "index_enemy_items_on_enemy_id"
    t.index ["item_id"], name: "index_enemy_items_on_item_id"
  end

  create_table "enemy_skills", force: :cascade do |t|
    t.bigint "enemy_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enemy_id"], name: "index_enemy_skills_on_enemy_id"
    t.index ["skill_id"], name: "index_enemy_skills_on_skill_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "current_health", default: 0
    t.integer "max_health", default: 0
    t.integer "attack", default: 0
    t.integer "defense", default: 0
    t.integer "current_mp", default: 0
    t.integer "max_mp", default: 0
    t.integer "speed", default: 0
    t.integer "charm", default: 0
    t.integer "intelligence", default: 0
    t.integer "current_energy", default: 0
    t.integer "max_energy", default: 0
    t.integer "money", default: 0
    t.string "category"
    t.string "slot"
    t.integer "value", default: 0
    t.boolean "consumable"
    t.integer "convience_store", default: 0
    t.integer "crime", default: 0
    t.integer "resturaunt", default: 0
    t.integer "bounty_hunter", default: 0
    t.integer "required_current_health", default: 0
    t.integer "required_max_health", default: 0
    t.integer "required_attack", default: 0
    t.integer "required_defense", default: 0
    t.integer "required_current_mp", default: 0
    t.integer "required_max_mp", default: 0
    t.integer "required_speed", default: 0
    t.integer "required_charm", default: 0
    t.integer "required_intelligence", default: 0
    t.integer "required_current_energy", default: 0
    t.integer "required_max_energy", default: 0
    t.integer "required_money", default: 0
    t.integer "required_ranged", default: 0
    t.integer "required_sharp", default: 0
    t.integer "required_blunt", default: 0
    t.integer "required_heavy_armor", default: 0
    t.integer "required_light_armor", default: 0
    t.integer "required_convience_store", default: 0
    t.integer "required_crime", default: 0
    t.integer "required_resturaunt", default: 0
    t.integer "required_bounty_hunter", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "current_health", default: 0
    t.integer "max_health", default: 0
    t.integer "attack", default: 0
    t.integer "defense", default: 0
    t.integer "mp", default: 0
    t.integer "speed", default: 0
    t.integer "charm", default: 0
    t.integer "intelligence", default: 0
    t.integer "current_energy", default: 0
    t.integer "max_energy", default: 0
    t.integer "money", default: 0
    t.integer "ranged", default: 0
    t.integer "sharp", default: 0
    t.integer "blunt", default: 0
    t.integer "heavy_armor", default: 0
    t.integer "light_armor", default: 0
    t.integer "convience_store", default: 0
    t.integer "crime", default: 0
    t.integer "resturaunt", default: 0
    t.integer "bounty_hunter", default: 0
    t.integer "required_current_health", default: 0
    t.integer "required_max_health", default: 0
    t.integer "required_attack", default: 0
    t.integer "required_defense", default: 0
    t.integer "required_current_mp", default: 0
    t.integer "required_max_mp", default: 0
    t.integer "required_speed", default: 0
    t.integer "required_charm", default: 0
    t.integer "required_intelligence", default: 0
    t.integer "required_current_energy", default: 0
    t.integer "required_max_energy", default: 0
    t.integer "required_money", default: 0
    t.integer "required_ranged", default: 0
    t.integer "required_sharp", default: 0
    t.integer "required_blunt", default: 0
    t.integer "required_heavy_armor", default: 0
    t.integer "required_light_armor", default: 0
    t.integer "required_convience_store", default: 0
    t.integer "required_crime", default: 0
    t.integer "required_resturaunt", default: 0
    t.integer "required_bounty_hunter", default: 0
    t.bigint "area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["area_id"], name: "index_jobs_on_area_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "player_bg"
  end

  create_table "player_items", force: :cascade do |t|
    t.boolean "equipped"
    t.bigint "player_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_player_items_on_item_id"
    t.index ["player_id"], name: "index_player_items_on_player_id"
  end

  create_table "player_skills", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_skills_on_player_id"
    t.index ["skill_id"], name: "index_player_skills_on_skill_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "avatar"
    t.integer "current_health", default: 10
    t.integer "max_health", default: 10
    t.integer "attack", default: 8
    t.integer "defense", default: 4
    t.integer "current_mp", default: 4
    t.integer "max_mp", default: 4
    t.integer "speed", default: 4
    t.integer "charm", default: 4
    t.integer "intelligence", default: 4
    t.integer "current_energy", default: 10
    t.integer "max_energy", default: 10
    t.integer "money", default: 0
    t.integer "ranged", default: 0
    t.integer "sharp", default: 0
    t.integer "blunt", default: 0
    t.integer "heavy_armor", default: 0
    t.integer "light_armor", default: 0
    t.integer "convience_store", default: 0
    t.integer "crime", default: 0
    t.integer "resturaunt", default: 0
    t.integer "bounty_hunter", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "map_id", null: false
    t.index ["map_id"], name: "index_players_on_map_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "damage", default: 0
    t.string "description"
    t.string "category"
    t.string "visual"
    t.string "icon"
    t.integer "current_health", default: 0
    t.integer "max_health", default: 0
    t.integer "attack", default: 0
    t.integer "defense", default: 0
    t.integer "current_mp", default: 0
    t.integer "max_mp", default: 0
    t.integer "speed", default: 0
    t.integer "charm", default: 0
    t.integer "intelligence", default: 0
    t.integer "current_energy", default: 0
    t.integer "max_energy", default: 0
    t.integer "money", default: 0
    t.integer "ranged", default: 0
    t.integer "sharp", default: 0
    t.integer "blunt", default: 0
    t.integer "heavy_armor", default: 0
    t.integer "light_armor", default: 0
    t.integer "convience_store", default: 0
    t.integer "crime", default: 0
    t.integer "resturaunt", default: 0
    t.integer "bounty_hunter", default: 0
    t.integer "required_current_health", default: 0
    t.integer "required_max_health", default: 0
    t.integer "required_attack", default: 0
    t.integer "required_defense", default: 0
    t.integer "required_current_mp", default: 0
    t.integer "required_max_mp", default: 0
    t.integer "required_speed", default: 0
    t.integer "required_charm", default: 0
    t.integer "required_intelligence", default: 0
    t.integer "required_current_energy", default: 0
    t.integer "required_max_energy", default: 0
    t.integer "required_money", default: 0
    t.integer "required_ranged", default: 0
    t.integer "required_sharp", default: 0
    t.integer "required_blunt", default: 0
    t.integer "required_heavy_armor", default: 0
    t.integer "required_light_armor", default: 0
    t.integer "required_convience_store", default: 0
    t.integer "required_crime", default: 0
    t.integer "required_resturaunt", default: 0
    t.integer "required_bounty_hunter", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "area_items", "areas"
  add_foreign_key "area_items", "items"
  add_foreign_key "area_skills", "areas"
  add_foreign_key "area_skills", "skills"
  add_foreign_key "areas", "maps"
  add_foreign_key "enemies", "jobs"
  add_foreign_key "enemy_items", "enemies"
  add_foreign_key "enemy_items", "items"
  add_foreign_key "enemy_skills", "enemies"
  add_foreign_key "enemy_skills", "skills"
  add_foreign_key "jobs", "areas"
  add_foreign_key "player_items", "items"
  add_foreign_key "player_items", "players"
  add_foreign_key "player_skills", "players"
  add_foreign_key "player_skills", "skills"
  add_foreign_key "players", "maps"
end
