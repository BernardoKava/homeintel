class AddReferenceNumberToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :reference_number, :integer
  end
end
