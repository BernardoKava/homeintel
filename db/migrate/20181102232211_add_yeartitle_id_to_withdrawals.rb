class AddYeartitleIdToWithdrawals < ActiveRecord::Migration[5.2]
  def change
    add_column :withdrawals, :yeartitle_id, :integer
  end
end
