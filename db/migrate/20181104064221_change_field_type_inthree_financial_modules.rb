class ChangeFieldTypeInthreeFinancialModules < ActiveRecord::Migration[5.2]
  def change
    change_column :budgets, :month, :string
    change_column :budgets, :year, :string
    change_column :cashflows, :month, :string
    change_column :cashflows, :year, :string
    change_column :savings, :month, :string
    change_column :savings, :year, :string
    change_column :ledgers, :month, :string
    change_column :ledgers, :year, :string
  end
end
