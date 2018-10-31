class AddBalanceToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :balance, :numeric
  end
end
