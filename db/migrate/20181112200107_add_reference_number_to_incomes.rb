class AddReferenceNumberToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :reference_number, :integer
  end
end
