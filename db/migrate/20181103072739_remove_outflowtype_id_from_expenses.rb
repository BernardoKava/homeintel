class RemoveOutflowtypeIdFromExpenses < ActiveRecord::Migration[5.2]
  def change
    remove_column :expenses, :Outflowtype_id, :integer
  end
end
