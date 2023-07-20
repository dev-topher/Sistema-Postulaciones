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

ActiveRecord::Schema[7.0].define(version: 2023_07_14_173055) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.date "f_inicio", null: false
    t.date "f_fin", null: false
    t.integer "status", default: 1, null: false
    t.integer "min_creditos_sct", null: false
    t.integer "max_creditos_sct", null: false
    t.integer "ramos_reprobados", null: false
    t.boolean "notificacion", default: false, null: false
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_announcements_on_program_id"
  end

  create_table "answers", force: :cascade do |t|
    t.text "answer", null: false
    t.bigint "question_id"
    t.bigint "apply_id"
    t.index ["apply_id"], name: "index_answers_on_apply_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "applies", force: :cascade do |t|
    t.string "citizenship"
    t.integer "mobile"
    t.string "second_email"
    t.integer "second_language", null: false
    t.integer "third_language", null: false
    t.integer "first_college", null: false
    t.integer "second_college", null: false
    t.integer "third_college", null: false
    t.integer "seelected", default: 0, null: false
    t.integer "status", default: 1
    t.bigint "announcement_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_applies_on_announcement_id"
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "credits", null: false
    t.bigint "college_id"
    t.index ["college_id"], name: "index_careers_on_college_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_colleges_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 100
  end

  create_table "detail_programs", force: :cascade do |t|
    t.bigint "program_id"
    t.bigint "college_id"
    t.index ["college_id"], name: "index_detail_programs_on_college_id"
    t.index ["program_id"], name: "index_detail_programs_on_program_id"
  end

  create_table "forms", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "program_id"
    t.index ["program_id"], name: "index_forms_on_program_id"
    t.index ["question_id"], name: "index_forms_on_question_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "language", null: false
    t.integer "status", default: 1, null: false
  end

  create_table "multiple_question_choices", force: :cascade do |t|
    t.integer "option_pm", null: false
    t.bigint "question_id"
    t.index ["question_id"], name: "index_multiple_question_choices_on_question_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "status", default: 1, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "question_type", null: false
    t.string "title", null: false
    t.integer "input_type", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rut", null: false
    t.string "name", null: false
    t.integer "enrollment", null: false
    t.date "d_born", null: false
    t.boolean "regular_student", null: false
    t.integer "credits_approved", null: false
    t.integer "failed_subjects", null: false
    t.boolean "has_debts", null: false
    t.boolean "has_intern_debts", null: false
    t.bigint "career_id"
    t.index ["career_id"], name: "index_users_on_career_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "announcements", "programs"
  add_foreign_key "answers", "applies"
  add_foreign_key "answers", "questions"
  add_foreign_key "applies", "announcements"
  add_foreign_key "applies", "users"
  add_foreign_key "careers", "colleges"
  add_foreign_key "colleges", "countries"
  add_foreign_key "detail_programs", "colleges"
  add_foreign_key "detail_programs", "programs"
  add_foreign_key "forms", "programs"
  add_foreign_key "forms", "questions"
  add_foreign_key "multiple_question_choices", "questions"
  add_foreign_key "users", "careers"
end
