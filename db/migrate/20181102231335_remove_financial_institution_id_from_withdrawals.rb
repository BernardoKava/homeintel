class RemoveFinancialInstitutionIdFromWithdrawals < ActiveRecord::Migration[5.2]
  def change
    remove_column :withdrawals, :financial_institution_id, :integer
  end
end
