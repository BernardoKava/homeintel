class AddAccessControlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :access_granted, :boolean
  end
end
