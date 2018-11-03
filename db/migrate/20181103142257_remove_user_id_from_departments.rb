class RemoveUserIdFromDepartments < ActiveRecord::Migration[5.2]
  def change
    remove_column :departments, :user_id, :integer
  end
end
