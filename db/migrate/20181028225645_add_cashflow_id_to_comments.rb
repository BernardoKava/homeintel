class AddCashflowIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :cashflow_id, :integer
  end
end
