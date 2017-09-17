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

ActiveRecord::Schema.define(version: 20170917041440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.bigint "contestant_id"
    t.bigint "play_id"
    t.bigint "week_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestant_id"], name: "index_actions_on_contestant_id"
    t.index ["play_id"], name: "index_actions_on_play_id"
    t.index ["week_id"], name: "index_actions_on_week_id"
  end

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.string "headshot"
    t.string "bio"
    t.bigint "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "hometown"
    t.string "occupation"
    t.string "twitter_handle"
    t.index ["season_id"], name: "index_contestants_on_season_id"
  end

  create_table "draft_picks", force: :cascade do |t|
    t.bigint "contestant_id"
    t.bigint "team_id"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestant_id"], name: "index_draft_picks_on_contestant_id"
    t.index ["team_id"], name: "index_draft_picks_on_team_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.bigint "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_leagues_on_season_id"
  end

  create_table "plays", force: :cascade do |t|
    t.string "description"
    t.integer "point_value"
    t.bigint "season_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_type"], name: "index_plays_on_season_type"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "season_number"
    t.bigint "season_type"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "headshot"
    t.date "draft_date"
    t.index ["season_type"], name: "index_seasons_on_season_type"
  end

  create_table "team_contestants", force: :cascade do |t|
    t.bigint "contestant_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestant_id"], name: "index_team_contestants_on_contestant_id"
    t.index ["team_id"], name: "index_team_contestants_on_team_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_drafted?"
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_contestants", force: :cascade do |t|
    t.bigint "contestant_id"
    t.bigint "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestant_id"], name: "index_weekly_contestants_on_contestant_id"
    t.index ["week_id"], name: "index_weekly_contestants_on_week_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.date "date"
    t.integer "week_number"
    t.bigint "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_weeks_on_season_id"
  end

  add_foreign_key "actions", "contestants"
  add_foreign_key "actions", "plays"
  add_foreign_key "actions", "weeks"
  add_foreign_key "contestants", "seasons"
  add_foreign_key "draft_picks", "contestants"
  add_foreign_key "draft_picks", "teams"
  add_foreign_key "leagues", "seasons"
  add_foreign_key "team_contestants", "contestants"
  add_foreign_key "team_contestants", "teams"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
  add_foreign_key "teams", "leagues"
  add_foreign_key "weekly_contestants", "contestants"
  add_foreign_key "weekly_contestants", "weeks"
  add_foreign_key "weeks", "seasons"
end
