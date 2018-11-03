class AddCashflowNumberToCashflows < ActiveRecord::Migration[5.2]
  def change
    add_column :cashflows, :cashflow_number, :string
  end
end
