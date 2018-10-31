class AddBalanceToCashflows < ActiveRecord::Migration[5.2]
  def change
    add_column :cashflows, :balance, :numeric
  end
end
