class AddPersonIdToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :person_id, :integer
  end
end
