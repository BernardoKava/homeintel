class RemovePersonIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :person_id, :integer
  end
end
