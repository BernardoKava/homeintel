class AddLocationToInventories < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :location, :string
  end
end
