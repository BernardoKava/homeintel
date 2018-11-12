class AddReferenceNumberToWithdrawals < ActiveRecord::Migration[5.2]
  def change
    add_column :withdrawals, :reference_number, :integer
  end
end
