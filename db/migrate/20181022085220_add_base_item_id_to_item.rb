class AddBaseItemIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :base_item_id, :integer
  end
end
