class ChangeMonthToBeDateInBudgetsCashflowsSavingsLedgers < ActiveRecord::Migration[5.2]
  def change
    change_column :budgets, :month, :date
    change_column :budgets, :year, :date
    change_column :cashflows, :month, :date
    change_column :cashflows, :year, :date
    change_column :savings, :month, :date
    change_column :savings, :year, :date
    change_column :ledgers, :month, :date
    change_column :ledgers, :year, :date
  end
end
