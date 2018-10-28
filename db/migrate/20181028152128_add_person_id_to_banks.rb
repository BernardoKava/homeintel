class AddPersonIdToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :person_id, :integer
  end
end
