class AddPersonIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :person_id, :integer
  end
end
