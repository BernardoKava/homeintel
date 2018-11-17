class AddPersonIdToSavingRecons < ActiveRecord::Migration[5.2]
  def change
    add_column :saving_recons, :person_id, :integer
  end
end
