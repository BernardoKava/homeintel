class AddPersonIdToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :person_id, :integer
  end
end
