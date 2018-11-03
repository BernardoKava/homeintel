class AddOutflowtypeIdToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :outflowtype_id, :integer
  end
end
