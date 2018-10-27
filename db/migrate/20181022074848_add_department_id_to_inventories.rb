class AddDepartmentIdToInventories < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :department_id, :integer
  end
end
