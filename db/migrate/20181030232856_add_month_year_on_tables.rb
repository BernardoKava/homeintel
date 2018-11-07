class AddMonthYearOnTables < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :year, :string
    add_column :inflows, :month, :string
    add_column :outflows, :month,:string
    add_column :outflows, :year, :string
    add_column :incomes, :year, :string
    add_column :incomes, :month, :string
    add_column :lodgements, :year, :string
    add_column :lodgements, :month, :string
    add_column :withdrawals, :month, :string
    add_column :withdrawals, :year, :string
  end
end
