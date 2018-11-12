class RemoveReferenceNumberFromExpenses < ActiveRecord::Migration[5.2]
  def change
    remove_column :expenses, :reference_number, :integer
  end
end
