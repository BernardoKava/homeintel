class RemoveReferenceNumberFromIncomes < ActiveRecord::Migration[5.2]
  def change
    remove_column :incomes, :reference_number, :integer
  end
end
