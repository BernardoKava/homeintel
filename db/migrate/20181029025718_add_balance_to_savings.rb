class AddBalanceToSavings < ActiveRecord::Migration[5.2]
  def change
    add_column :savings, :balance, :numeric
  end
end
