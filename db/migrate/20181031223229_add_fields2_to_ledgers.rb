class AddFields2ToLedgers < ActiveRecord::Migration[5.2]
  def change
    add_column :ledgers, :annual_total_income, :numeric
    add_column :ledgers, :annual_total_expenditure, :numeric
  end
end
