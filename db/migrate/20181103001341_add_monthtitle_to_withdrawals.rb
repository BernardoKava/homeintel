class AddMonthtitleToWithdrawals < ActiveRecord::Migration[5.2]
  def change
    add_column :withdrawals, :monthtitle_id, :integer
  end
end
