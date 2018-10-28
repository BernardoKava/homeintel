class AddUserIdToReferences < ActiveRecord::Migration[5.2]
  def change
    add_column :references, :user_id, :integer
  end
end
