class AddDatePostedToWithdrawals < ActiveRecord::Migration[5.2]
  def change
    add_column :withdrawals, :date_posted, :date
  end
end
