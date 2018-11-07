class AddUserNameToPasswordrepositories < ActiveRecord::Migration[5.2]
  def change
    add_column :passwordrepositories, :user_name, :string
  end
end
