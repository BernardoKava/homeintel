class RemoveOwnerFromDepartments < ActiveRecord::Migration[5.2]
  def change
    remove_column :departments, :owner, :string
  end
end
