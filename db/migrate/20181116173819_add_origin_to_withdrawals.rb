class AddOriginToWithdrawals < ActiveRecord::Migration[5.2]
  def change
    add_column :withdrawals, :origination, :string
    add_column :withdrawals, :rationale, :text
  end
end
