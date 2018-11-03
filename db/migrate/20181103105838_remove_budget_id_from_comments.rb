class RemoveBudgetIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :budget_id, :integer
  end
end
