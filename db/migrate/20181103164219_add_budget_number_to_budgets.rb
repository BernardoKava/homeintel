class AddBudgetNumberToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :budget_number, :string
  end
end
