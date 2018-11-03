class AddYeartitleIdToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :yeartitle_id, :integer
  end
end
