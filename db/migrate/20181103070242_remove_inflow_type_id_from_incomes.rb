class RemoveInflowTypeIdFromIncomes < ActiveRecord::Migration[5.2]
  def change
    remove_column :incomes, :inflow_type_id, :integer
  end
end
