class AddFinancialinstitutionIdToWithdrawals < ActiveRecord::Migration[5.2]
  def change
    add_column :withdrawals, :financialinstitution_id, :integer
  end
end
