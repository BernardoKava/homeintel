class AddIncomeTypeToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :income_type, :string
  end
end
