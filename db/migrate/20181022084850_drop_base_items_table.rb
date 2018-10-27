class DropBaseItemsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :base_items
  end
end
