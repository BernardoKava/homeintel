class RemoveColumnItemIdFromBaseItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :base_items, :item_id
  end
end
