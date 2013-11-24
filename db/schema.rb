# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131123185957) do

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "build_command"
    t.string   "execute_command"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", force: true do |t|
    t.string   "name"
    t.string   "short_description"
    t.text     "long_description"
    t.integer  "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "problems", ["challenge_id"], name: "index_problems_on_challenge_id"

  create_table "submission_result_statuses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submission_results", force: true do |t|
    t.string   "details"
    t.boolean  "completed",     default: false
    t.integer  "status"
    t.integer  "submission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.text     "code"
    t.integer  "language_id"
    t.integer  "problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_case_results", force: true do |t|
    t.integer  "status"
    t.integer  "test_case_id"
    t.integer  "submission_result_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_case_results", ["submission_result_id"], name: "index_test_case_results_on_submission_result_id"

  create_table "test_cases", force: true do |t|
    t.text     "input"
    t.text     "expected_output"
    t.integer  "problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_cases", ["problem_id"], name: "index_test_cases_on_problem_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
