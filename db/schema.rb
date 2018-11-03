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

ActiveRecord::Schema.define(version: 2018_11_03_164219) do

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.integer "user_id"
    t.boolean "active"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "addrespool_id"
  end

  create_table "addresspools", force: :cascade do |t|
    t.string "address"
    t.boolean "active"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "user_id"
    t.string "iban"
    t.string "bic"
    t.text "accessibility"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner"
    t.integer "person_id"
  end

  create_table "base_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "owner"
    t.boolean "active"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgetcomments", force: :cascade do |t|
    t.text "commentary"
    t.integer "user_id"
    t.integer "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "user_id"
    t.date "month"
    t.date "year"
    t.date "budget_date"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance"
    t.string "budget_number"
  end

  create_table "cashflows", force: :cascade do |t|
    t.date "month"
    t.date "year"
    t.date "accounting_date"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "inventory_id"
    t.integer "user_id"
    t.text "commentary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
    t.integer "cashflow_id"
    t.integer "saving_id"
    t.integer "delivery_id"
    t.integer "budget_id"
    t.index ["inventory_id"], name: "index_comments_on_inventory_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.date "delivery_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "receiver"
    t.integer "person_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "email"
    t.integer "user_id"
    t.boolean "active"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employments", force: :cascade do |t|
    t.string "company"
    t.string "position"
    t.date "from"
    t.date "to"
    t.text "terminationreason"
    t.boolean "actve"
    t.integer "person_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "owner"
    t.decimal "amount"
    t.string "expense_type"
    t.integer "user_id"
    t.integer "budget_id"
    t.text "details"
    t.string "month"
    t.string "year"
    t.integer "person_id"
    t.integer "yeartitle_id"
    t.integer "monthtitle_id"
    t.integer "outflowtype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financialinstitutions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.string "telephone"
    t.string "email"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.string "owner"
    t.decimal "amount"
    t.text "details"
    t.integer "user_id"
    t.integer "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "income_type"
    t.string "year"
    t.string "month"
    t.integer "person_id"
    t.integer "inflowtype_id"
    t.integer "yeartitle_id"
    t.integer "monthtitle_id"
  end

  create_table "inflows", force: :cascade do |t|
    t.string "owner"
    t.decimal "amount"
    t.text "details"
    t.string "flow_type"
    t.integer "user_id"
    t.integer "cashflow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year"
    t.string "month"
    t.integer "person_id"
    t.integer "inflowtype_id"
    t.integer "yeartitle_id"
    t.integer "monthtitle_id"
  end

  create_table "inflowtypes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "department"
    t.boolean "active"
    t.integer "user_id"
    t.date "period_from"
    t.date "period_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
    t.string "location"
    t.string "inventory_number"
  end

  create_table "items", force: :cascade do |t|
    t.integer "inventory_id"
    t.string "item"
    t.text "description"
    t.decimal "quantity"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_items_on_inventory_id"
  end

  create_table "ledgers", force: :cascade do |t|
    t.date "month"
    t.date "year"
    t.date "ledger_date"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "annual_budget_bal"
    t.decimal "annual_cashflow_bal"
    t.decimal "annual_saving_bal"
    t.decimal "annual_total_income"
    t.decimal "annual_total_expenditure"
  end

  create_table "lodgements", force: :cascade do |t|
    t.string "owner"
    t.decimal "amount"
    t.text "details"
    t.integer "user_id"
    t.integer "saving_id"
    t.string "institution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year"
    t.string "month"
    t.integer "person_id"
    t.integer "financialinstitution_id"
    t.integer "yeartitle_id"
    t.integer "monthtitle_id"
  end

  create_table "monthtitles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outflows", force: :cascade do |t|
    t.string "owner"
    t.decimal "amount"
    t.text "details"
    t.string "flow_type"
    t.integer "user_id"
    t.integer "cashflow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "month"
    t.string "year"
    t.integer "person_id"
    t.integer "yeartitle_id"
    t.integer "outflowtype_id"
    t.integer "monthtitle_id"
  end

  create_table "outflowtypes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "fullname"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dob"
  end

  create_table "posts", force: :cascade do |t|
    t.string "post_type"
    t.text "description"
    t.string "signed_for_by"
    t.boolean "scanned"
    t.integer "user_id"
    t.integer "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner"
    t.integer "person_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "name"
    t.string "school"
    t.date "from"
    t.date "to"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.integer "person_id"
    t.integer "user_id"
  end

  create_table "references", force: :cascade do |t|
    t.string "employer"
    t.string "referee"
    t.string "telephone"
    t.string "email"
    t.text "details"
    t.integer "person_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.integer "user_id"
    t.date "month"
    t.date "year"
    t.date "saving_date"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance"
    t.integer "ledger_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.string "telephone"
    t.integer "user_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telephones", force: :cascade do |t|
    t.string "phone"
    t.integer "user_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "withdrawals", force: :cascade do |t|
    t.string "owner"
    t.decimal "amount"
    t.text "details"
    t.integer "user_id"
    t.integer "saving_id"
    t.string "institution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "month"
    t.string "year"
    t.integer "person_id"
    t.integer "financialinstitution_id"
    t.integer "yeartitle_id"
    t.integer "monthtitle_id"
  end

  create_table "yeartitles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
