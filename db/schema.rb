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

ActiveRecord::Schema.define(version: 20161214183536) do

  create_table "appointments", force: :cascade do |t|
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "reason",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctor_id",  limit: 4
    t.integer  "patient_id", limit: 4
    t.integer  "status",     limit: 4,   default: 0
  end

  add_index "appointments", ["doctor_id"], name: "index_appointments_on_doctor_id", using: :btree
  add_index "appointments", ["patient_id"], name: "index_appointments_on_patient_id", using: :btree

  create_table "doctor_profiles", force: :cascade do |t|
    t.string  "education",            limit: 255
    t.string  "specialty",            limit: 255
    t.string  "experience",           limit: 255
    t.string  "practice_clinic_name", limit: 255
    t.string  "clinic_address",       limit: 255
    t.string  "clinic_contact_no",    limit: 255
    t.string  "website",              limit: 255
    t.string  "consultation_fee",     limit: 255
    t.integer "doctor_id",            limit: 4
  end

  add_index "doctor_profiles", ["doctor_id"], name: "index_doctor_profiles_on_doctor_id", using: :btree

  create_table "interactions", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "medicine_formulary_id", limit: 4
  end

  add_index "interactions", ["medicine_formulary_id"], name: "index_interactions_on_medicine_formulary_id", using: :btree

  create_table "known_problems", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patient_id", limit: 4
    t.integer  "problem_id", limit: 4
    t.string   "details",    limit: 255
  end

  add_index "known_problems", ["patient_id"], name: "index_known_problems_on_patient_id", using: :btree
  add_index "known_problems", ["problem_id"], name: "index_known_problems_on_problem_id", using: :btree

  create_table "medical_tests", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "prescription_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "medical_tests", ["prescription_id"], name: "index_medical_tests_on_prescription_id", using: :btree

  create_table "medicine_formularies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "brand_name", limit: 255
    t.string   "price",      limit: 255
    t.string   "uses",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "precautions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "details",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prescribed_medicines", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "strength",        limit: 255
    t.string   "dosage",          limit: 255
    t.string   "duration",        limit: 255
    t.text     "note",            limit: 65535
    t.integer  "prescription_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "prescribed_medicines", ["prescription_id"], name: "index_prescribed_medicines_on_prescription_id", using: :btree

  create_table "prescriptions", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "current_weight", limit: 255
    t.integer  "appointment_id", limit: 4
  end

  add_index "prescriptions", ["appointment_id"], name: "index_prescriptions_on_appointment_id", using: :btree

  create_table "problems", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "details",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patient_id",      limit: 4
    t.integer  "prescription_id", limit: 4
  end

  add_index "problems", ["patient_id"], name: "index_problems_on_patient_id", using: :btree
  add_index "problems", ["prescription_id"], name: "index_problems_on_prescription_id", using: :btree

  create_table "side_effects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_slots", force: :cascade do |t|
    t.string   "day",           limit: 255
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "patient_count", limit: 4,   default: 1
    t.integer  "duration",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctor_id",     limit: 4
  end

  add_index "time_slots", ["doctor_id"], name: "index_time_slots_on_doctor_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "sex",                    limit: 255
    t.date     "date_of_birth"
    t.string   "contact_no",             limit: 255
    t.text     "address",                limit: 65535
    t.string   "type",                   limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "medical_tests", "prescriptions"
  add_foreign_key "prescribed_medicines", "prescriptions"
end
