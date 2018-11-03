class AddYeartitleIdToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :yeartitle_id, :integer
  end
end
