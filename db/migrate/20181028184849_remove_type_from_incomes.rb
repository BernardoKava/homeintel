class RemoveTypeFromIncomes < ActiveRecord::Migration[5.2]
  def change
    remove_column :incomes, :type, :string
  end
end
