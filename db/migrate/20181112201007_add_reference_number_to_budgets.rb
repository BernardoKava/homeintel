class AddReferenceNumberToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :reference_number, :integer
  end
end
