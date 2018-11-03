class AddPersonIdToWithdrawals < ActiveRecord::Migration[5.2]
  def change
    add_column :withdrawals, :person_id, :integer
  end
end
