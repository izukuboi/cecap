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

ActiveRecord::Schema.define(version: 2019_06_27_130558) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "descripton"
    t.integer "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tutor_id"
    t.index ["program_id"], name: "index_courses_on_program_id"
    t.index ["tutor_id"], name: "index_courses_on_tutor_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.index ["course_id"], name: "index_evaluations_on_course_id"
  end

  create_table "grade_evaluations", force: :cascade do |t|
    t.integer "grade"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "evaluation_id"
    t.integer "student_id"
    t.index ["evaluation_id"], name: "index_grade_evaluations_on_evaluation_id"
    t.index ["student_id"], name: "index_grade_evaluations_on_student_id"
  end

  create_table "grade_practices", force: :cascade do |t|
    t.integer "grade"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "practice_id"
    t.integer "student_id"
    t.index ["practice_id"], name: "index_grade_practices_on_practice_id"
    t.index ["student_id"], name: "index_grade_practices_on_student_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.index ["course_id"], name: "index_materials_on_course_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "program_id"
    t.integer "student_id"
    t.integer "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_payments_on_program_id"
    t.index ["student_id"], name: "index_payments_on_student_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.index ["course_id"], name: "index_practices_on_course_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "nombrePrograma"
    t.integer "NumModulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.float "amount"
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tutors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "apellidop"
    t.string "apellidom"
    t.string "email"
    t.integer "numeroTelf"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
