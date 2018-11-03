class AddInventoryNumberToInventories < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :inventory_number, :string
  end
end
