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

ActiveRecord::Schema[7.0].define(version: 2023_07_06_215059) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_category_id"
    t.index ["parent_category_id"], name: "index_categories_on_parent_category_id"
  end

  create_table "commands", force: :cascade do |t|
    t.string "name"
  end

  create_table "game_categories", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_game_categories_on_category_id"
    t.index ["game_id"], name: "index_game_categories_on_game_id"
  end

  create_table "game_languages", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "language_id"
    t.index ["game_id"], name: "index_game_languages_on_game_id"
    t.index ["language_id"], name: "index_game_languages_on_language_id"
  end

  create_table "game_list_values", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "list_value_id"
    t.bigint "guesser_id"
    t.boolean "picked"
    t.index ["game_id"], name: "index_game_list_values_on_game_id"
    t.index ["guesser_id"], name: "index_game_list_values_on_guesser_id"
    t.index ["list_value_id"], name: "index_game_list_values_on_list_value_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "platform"
    t.string "platform_id"
    t.bigint "list_id"
    t.boolean "enabled", default: true, null: false
    t.integer "hints", default: 0
    t.integer "cycles", default: 0
    t.datetime "last_cycled_at"
    t.datetime "last_played_at"
    t.integer "lists_played"
    t.boolean "introduces", default: true
    t.boolean "sasses", default: true
    t.boolean "snubs", default: true
    t.boolean "updates", default: true
    t.index ["list_id"], name: "index_games_on_list_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
  end

  create_table "list_categories", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_list_categories_on_category_id"
    t.index ["list_id"], name: "index_list_categories_on_list_id"
  end

  create_table "list_values", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "created_by_id"
    t.string "value", null: false
    t.text "blurb"
    t.integer "blurb_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_list_values_on_created_by_id"
    t.index ["list_id"], name: "index_list_values_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "legacy_id"
    t.bigint "created_by_id"
    t.bigint "language_id"
    t.string "name", null: false
    t.string "search"
    t.text "description"
    t.integer "frequency", default: 0
    t.integer "difficulty", default: 0
    t.boolean "immutable", default: false, null: false
    t.boolean "enabled", default: true, null: false
    t.integer "plays", default: 0
    t.integer "skips", default: 0
    t.integer "hints", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_lists_on_created_by_id"
    t.index ["language_id"], name: "index_lists_on_language_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "user_id"
    t.integer "score", default: 0
    t.integer "daily_score", default: 0
    t.integer "high_score", default: 0
    t.integer "plays", default: 0
    t.integer "wins", default: 0
    t.integer "answers", default: 0
    t.integer "lists", default: 0
    t.integer "hints", default: 0
    t.integer "snubs", default: 0
    t.integer "skips", default: 0
    t.integer "vetoes", default: 0
    t.integer "suggestions", default: 0
    t.integer "searches", default: 0
    t.integer "current_play_streak", default: 0
    t.integer "current_game_streak", default: 0
    t.integer "current_hint_streak", default: 0
    t.integer "max_play_streak", default: 0
    t.integer "max_game_streak", default: 0
    t.integer "max_hint_streak", default: 0
    t.datetime "last_played_at"
    t.boolean "present", default: true
    t.integer "minigame_plays", default: 0
    t.integer "tinygame_plays", default: 0
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "translations", force: :cascade do |t|
    t.bigint "language_id"
    t.string "source_type"
    t.bigint "source_id"
    t.string "translation"
    t.index ["language_id"], name: "index_translations_on_language_id"
    t.index ["source_type", "source_id"], name: "index_translations_on_source"
  end

  create_table "users", force: :cascade do |t|
    t.integer "provider"
    t.string "legacy_id"
    t.string "uid"
    t.string "name"
    t.string "username"
    t.string "telegram_name"
    t.string "telegram_username"
    t.decimal "telegram_id", precision: 64
    t.string "email"
    t.boolean "email_verified"
    t.boolean "admin"
    t.boolean "banned"
    t.string "photo_url"
    t.datetime "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "voter_id"
    t.bigint "list_id"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_votes_on_list_id"
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "game_list_values", "players", column: "guesser_id"
  add_foreign_key "list_values", "users", column: "created_by_id"
  add_foreign_key "lists", "users", column: "created_by_id"
  add_foreign_key "votes", "users", column: "voter_id"
end
