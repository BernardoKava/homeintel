class RemoveInflowTypeIdFromInflows < ActiveRecord::Migration[5.2]
  def change
    remove_column :inflows, :inflow_type_id, :integer
  end
end
