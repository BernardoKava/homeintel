class AddPersonIdToLodgements < ActiveRecord::Migration[5.2]
  def change
    add_column :lodgements, :person_id, :integer
  end
end
