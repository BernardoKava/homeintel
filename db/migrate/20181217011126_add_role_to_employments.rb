class AddRoleToEmployments < ActiveRecord::Migration[5.2]
  def change
    add_column :employments, :role, :text
  end
end
