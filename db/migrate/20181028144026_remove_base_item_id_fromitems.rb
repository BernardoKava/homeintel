class RemoveBaseItemIdFromitems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :base_item_id
  end
end
