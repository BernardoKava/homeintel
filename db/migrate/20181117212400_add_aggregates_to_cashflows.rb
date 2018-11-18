class AddAggregatesToCashflows < ActiveRecord::Migration[5.2]
  def change
    add_column :cashflows, :inflow_salary, :numeric
    add_column :cashflows, :inflow_child_benefit, :numeric
    add_column :cashflows, :inflow_lotto_winnings, :numeric
    add_column :cashflows, :inflow_other, :numeric
    add_column :cashflows, :outflow_rent, :numeric
    add_column :cashflows, :outflow_telecom, :numeric
    add_column :cashflows, :outflow_eflow, :numeric
    add_column :cashflows, :outflow_food, :numeric
    add_column :cashflows, :outflow_electricity, :numeric
    add_column :cashflows, :outflow_transport, :numeric
    add_column :cashflows, :outflow_credit_card_fees, :numeric
    add_column :cashflows, :outflow_current_account_fees, :numeric
    add_column :cashflows, :outflow_allowance_gaelle, :numeric
    add_column :cashflows, :outflow_allowance_herve, :numeric
    add_column :cashflows, :outflow_loan_ptsb, :numeric
    add_column :cashflows, :outflow_loan_chill, :numeric
    add_column :cashflows, :outflow_lodgement_cu, :numeric
    add_column :cashflows, :outflow_family_support, :numeric
    add_column :cashflows, :outflow_entert_nightout, :numeric
    add_column :cashflows, :outflow_entert_dayout, :numeric
    add_column :cashflows, :outflow_apple_str, :numeric
    add_column :cashflows, :outflow_aa_irl, :numeric
    add_column :cashflows, :outflow_lottery_ticket, :numeric
    add_column :cashflows, :outflow_car_tax, :numeric
    add_column :cashflows, :outflow_heating_oil, :numeric
    add_column :cashflows, :outflow_car_service, :numeric
    add_column :cashflows, :outflow_spiritual_tools, :numeric
    add_column :cashflows, :outflow_other_exp, :numeric
    add_column :cashflows, :outflow_work_lunch, :numeric
    add_column :cashflows, :outflow_pharmacy, :numeric
    add_column :cashflows, :outflow_furniture, :numeric
  end

end
