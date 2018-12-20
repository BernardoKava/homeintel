class AddVirtualToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :virtual, :boolean
  end
end
