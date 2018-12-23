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

ActiveRecord::Schema.define(version: 2018_12_23_025258) do

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.integer "user_id"
    t.boolean "active"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bankaccounts", force: :cascade do |t|
    t.integer "financialinstitution_id"
    t.string "account_number"
    t.string "sort_code"
    t.string "iban"
    t.string "bic"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_code"
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "user_id"
    t.string "month"
    t.string "year"
    t.date "budget_date"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance"
    t.string "budget_number"
    t.integer "reference_number"
    t.decimal "inflow_salary"
    t.decimal "inflow_child_benefit"
    t.decimal "inflow_lotto_winnings"
    t.decimal "inflow_other"
    t.decimal "outflow_rent"
    t.decimal "outflow_telecom"
    t.decimal "outflow_eflow"
    t.decimal "outflow_food"
    t.decimal "outflow_electricity"
    t.decimal "outflow_transport"
    t.decimal "outflow_credit_card_fees"
    t.decimal "outflow_current_account_fees"
    t.decimal "outflow_allowance_gaelle"
    t.decimal "outflow_allowance_herve"
    t.decimal "outflow_loan_ptsb"
    t.decimal "outflow_loan_chill"
    t.decimal "outflow_lodgement_cu"
    t.decimal "outflow_family_support"
    t.decimal "outflow_entert_nightout"
    t.decimal "outflow_entert_dayout"
    t.decimal "outflow_apple_str"
    t.decimal "outflow_aa_irl"
    t.decimal "outflow_lottery_ticket"
    t.decimal "outflow_car_tax"
    t.decimal "outflow_heating_oil"
    t.decimal "outflow_car_service"
    t.decimal "outflow_spiritual_tools"
    t.decimal "outflow_other_exp"
    t.decimal "outflow_work_lunch"
    t.decimal "outflow_pharmacy"
    t.decimal "outflow_furniture"
  end

  create_table "cashflow_recons", force: :cascade do |t|
    t.integer "cashflow_id"
    t.integer "user_id"
    t.text "error_details"
    t.text "reconciliation_rationale"
    t.decimal "correction_amount"
    t.string "authorised_by"
    t.date "authorisation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
  end

  create_table "cashflows", force: :cascade do |t|
    t.string "month"
    t.string "year"
    t.date "accounting_date"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance"
    t.string "cashflow_number"
    t.integer "reference_number"
    t.decimal "inflow_salary"
    t.decimal "inflow_child_benefit"
    t.decimal "inflow_lotto_winnings"
    t.decimal "inflow_other"
    t.decimal "outflow_rent"
    t.decimal "outflow_telecom"
    t.decimal "outflow_eflow"
    t.decimal "outflow_food"
    t.decimal "outflow_electricity"
    t.decimal "outflow_transport"
    t.decimal "outflow_credit_card_fees"
    t.decimal "outflow_current_account_fees"
    t.decimal "outflow_allowance_gaelle"
    t.decimal "outflow_allowance_herve"
    t.decimal "outflow_loan_ptsb"
    t.decimal "outflow_loan_chill"
    t.decimal "outflow_lodgement_cu"
    t.decimal "outflow_family_support"
    t.decimal "outflow_entert_nightout"
    t.decimal "outflow_entert_dayout"
    t.decimal "outflow_apple_str"
    t.decimal "outflow_aa_irl"
    t.decimal "outflow_lottery_ticket"
    t.decimal "outflow_car_tax"
    t.decimal "outflow_heating_oil"
    t.decimal "outflow_car_service"
    t.decimal "outflow_spiritual_tools"
    t.decimal "outflow_other_exp"
    t.decimal "outflow_work_lunch"
    t.decimal "outflow_pharmacy"
    t.decimal "outflow_furniture"
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
    t.integer "issue_management_id"
    t.index ["inventory_id"], name: "index_comments_on_inventory_id"
  end

  create_table "corrective_actions", force: :cascade do |t|
    t.string "title"
    t.integer "issue_management_id"
    t.date "target_completion_date"
    t.date "actual_completion_date"
    t.string "description"
    t.integer "person_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.date "delivery_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "receiver"
    t.integer "person_id"
    t.string "delivery_number"
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

  create_table "employmentreferences", force: :cascade do |t|
    t.string "referee_name"
    t.string "referee_telephone"
    t.string "referee_email"
    t.text "referee_details"
    t.integer "person_id"
    t.boolean "referee_active"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employment_id"
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
    t.string "company_address"
    t.string "company_telephone"
    t.string "company_email"
    t.text "company_details"
    t.text "role"
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
    t.string "institution_code"
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
    t.date "bank_record_date"
    t.date "date_posted"
    t.string "origination"
    t.text "rationale"
    t.integer "bankaccount_id"
    t.boolean "follow_up"
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

  create_table "issue_managements", force: :cascade do |t|
    t.string "issue_title"
    t.text "description"
    t.string "completion_rate"
    t.integer "person_id"
    t.integer "user_id"
    t.date "completion_target_date"
    t.date "completion_actual_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "inventory_id"
    t.string "item"
    t.text "description"
    t.decimal "quantity"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "virtual"
    t.index ["inventory_id"], name: "index_items_on_inventory_id"
  end

  create_table "ledgers", force: :cascade do |t|
    t.string "month"
    t.string "year"
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
    t.string "ledger_number"
    t.integer "reference_number"
    t.decimal "bud_inflow_salary"
    t.decimal "bud_inflow_child_benefit"
    t.decimal "bud_inflow_lotto_winnings"
    t.decimal "bud_inflow_other"
    t.decimal "bud_outflow_rent"
    t.decimal "bud_outflow_telecom"
    t.decimal "bud_outflow_eflow"
    t.decimal "bud_outflow_food"
    t.decimal "bud_outflow_electricity"
    t.decimal "bud_outflow_transport"
    t.decimal "bud_outflow_credit_card_fees"
    t.decimal "bud_outflow_current_account_fees"
    t.decimal "bud_outflow_allowance_gaelle"
    t.decimal "bud_outflow_allowance_herve"
    t.decimal "bud_outflow_loan_ptsb"
    t.decimal "bud_outflow_loan_chill"
    t.decimal "bud_outflow_lodgement_cu"
    t.decimal "bud_outflow_family_support"
    t.decimal "bud_outflow_entert_nightout"
    t.decimal "bud_outflow_entert_dayout"
    t.decimal "bud_outflow_apple_str"
    t.decimal "bud_outflow_aa_irl"
    t.decimal "bud_outflow_lottery_ticket"
    t.decimal "bud_outflow_car_tax"
    t.decimal "bud_outflow_heating_oil"
    t.decimal "bud_outflow_car_service"
    t.decimal "bud_outflow_spiritual_tools"
    t.decimal "bud_outflow_other_exp"
    t.decimal "bud_outflow_work_lunch"
    t.decimal "bud_outflow_pharmacy"
    t.decimal "bud_outflow_furniture"
    t.decimal "act_inflow_salary"
    t.decimal "act_inflow_child_benefit"
    t.decimal "act_inflow_lotto_winnings"
    t.decimal "act_inflow_other"
    t.decimal "act_outflow_rent"
    t.decimal "act_outflow_telecom"
    t.decimal "act_outflow_eflow"
    t.decimal "act_outflow_food"
    t.decimal "act_outflow_electricity"
    t.decimal "act_outflow_transport"
    t.decimal "act_outflow_credit_card_fees"
    t.decimal "act_outflow_current_account_fees"
    t.decimal "act_outflow_allowance_gaelle"
    t.decimal "act_outflow_allowance_herve"
    t.decimal "act_outflow_loan_ptsb"
    t.decimal "act_outflow_loan_chill"
    t.decimal "act_outflow_lodgement_cu"
    t.decimal "act_outflow_family_support"
    t.decimal "act_outflow_entert_nightout"
    t.decimal "act_outflow_entert_dayout"
    t.decimal "act_outflow_apple_str"
    t.decimal "act_outflow_aa_irl"
    t.decimal "act_outflow_lottery_ticket"
    t.decimal "act_outflow_car_tax"
    t.decimal "act_outflow_heating_oil"
    t.decimal "act_outflow_car_service"
    t.decimal "act_outflow_spiritual_tools"
    t.decimal "act_outflow_other_exp"
    t.decimal "act_outflow_work_lunch"
    t.decimal "act_outflow_pharmacy"
    t.decimal "act_outflow_furniture"
    t.text "note"
  end

  create_table "legacy_ulsterbanks", force: :cascade do |t|
    t.date "trans_date"
    t.string "trans_type"
    t.string "description"
    t.decimal "trans_value"
    t.string "account_name"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_managements", force: :cascade do |t|
    t.string "year"
    t.string "month"
    t.integer "loan_registration_id"
    t.date "payment_date"
    t.decimal "amount"
    t.text "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_registrations", force: :cascade do |t|
    t.integer "financialinstitution_id"
    t.string "loan_type"
    t.string "loan_term"
    t.text "rationale"
    t.decimal "amount"
    t.string "loan_reference"
    t.date "drawdown_date"
    t.date "final_payment_date"
    t.integer "user_id"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "internal_loan"
    t.decimal "outstanding"
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
    t.date "date_posted"
    t.string "origination"
    t.text "rationale"
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
    t.date "bank_record_date"
    t.date "date_posted"
    t.string "origination"
    t.text "rationale"
    t.integer "bankaccount_id"
    t.boolean "follow_up"
  end

  create_table "outflowtypes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passwordrepositories", force: :cascade do |t|
    t.string "system_name"
    t.string "system_password"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "fullname"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dob"
    t.string "person_number"
    t.string "pps_number"
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

  create_table "rent_managements", force: :cascade do |t|
    t.string "year"
    t.string "month"
    t.decimal "amount"
    t.date "date_collected"
    t.text "details"
    t.string "collected_by"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.string "link"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.text "definition"
    t.boolean "active"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "policy_code"
    t.integer "rules_category_id"
  end

  create_table "rules_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saving_recons", force: :cascade do |t|
    t.integer "saving_id"
    t.integer "user_id"
    t.text "error_details"
    t.text "reconciliation_rationale"
    t.decimal "correction_amount"
    t.string "authorised_by"
    t.date "authorisation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
  end

  create_table "savings", force: :cascade do |t|
    t.integer "user_id"
    t.string "month"
    t.string "year"
    t.date "saving_date"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance"
    t.string "saving_number"
    t.integer "reference_number"
  end

  create_table "service_providers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "telephone"
    t.string "email"
    t.string "acc_number"
    t.integer "user_id"
    t.boolean "active"
    t.string "link"
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
    t.boolean "access_granted"
    t.string "fullname"
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
    t.date "date_posted"
    t.string "origination"
    t.text "rationale"
  end

  create_table "yeartitles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
