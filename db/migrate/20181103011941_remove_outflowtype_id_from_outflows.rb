class RemoveOutflowtypeIdFromOutflows < ActiveRecord::Migration[5.2]
  def change
    remove_column :outflows, :inflow_type_id, :integer
  end
end
