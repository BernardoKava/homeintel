class AddFieldsToLedgers < ActiveRecord::Migration[5.2]
  def change
    add_column :ledgers, :annual_budget_bal, :numeric
    add_column :ledgers, :annual_cashflow_bal, :numeric
    add_column :ledgers, :annual_saving_bal, :numeric
  end
end
