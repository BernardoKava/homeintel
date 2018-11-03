class AddPersonIdToInflows < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :person_id, :integer
  end
end
