class AddOutflowtypeIdToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :outflowtype_id, :integer
  end
end
