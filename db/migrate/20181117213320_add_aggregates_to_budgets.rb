class AddAggregatesToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :inflow_salary, :numeric
    add_column :budgets, :inflow_child_benefit, :numeric
    add_column :budgets, :inflow_lotto_winnings, :numeric
    add_column :budgets, :inflow_other, :numeric
    add_column :budgets, :outflow_rent, :numeric
    add_column :budgets, :outflow_telecom, :numeric
    add_column :budgets, :outflow_eflow, :numeric
    add_column :budgets, :outflow_food, :numeric
    add_column :budgets, :outflow_electricity, :numeric
    add_column :budgets, :outflow_transport, :numeric
    add_column :budgets, :outflow_credit_card_fees, :numeric
    add_column :budgets, :outflow_current_account_fees, :numeric
    add_column :budgets, :outflow_allowance_gaelle, :numeric
    add_column :budgets, :outflow_allowance_herve, :numeric
    add_column :budgets, :outflow_loan_ptsb, :numeric
    add_column :budgets, :outflow_loan_chill, :numeric
    add_column :budgets, :outflow_lodgement_cu, :numeric
    add_column :budgets, :outflow_family_support, :numeric
    add_column :budgets, :outflow_entert_nightout, :numeric
    add_column :budgets, :outflow_entert_dayout, :numeric
    add_column :budgets, :outflow_apple_str, :numeric
    add_column :budgets, :outflow_aa_irl, :numeric
    add_column :budgets, :outflow_lottery_ticket, :numeric
    add_column :budgets, :outflow_car_tax, :numeric
    add_column :budgets, :outflow_heating_oil, :numeric
    add_column :budgets, :outflow_car_service, :numeric
    add_column :budgets, :outflow_spiritual_tools, :numeric
    add_column :budgets, :outflow_other_exp, :numeric
    add_column :budgets, :outflow_work_lunch, :numeric
    add_column :budgets, :outflow_pharmacy, :numeric
    add_column :budgets, :outflow_furniture, :numeric
  end
end
