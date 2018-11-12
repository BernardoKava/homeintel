class RemoveReferenceNumberFromWithdrawals < ActiveRecord::Migration[5.2]
  def change
    remove_column :withdrawals, :reference_number, :integer
  end
end
