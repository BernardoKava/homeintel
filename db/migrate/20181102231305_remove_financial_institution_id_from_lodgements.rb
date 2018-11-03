class RemoveFinancialInstitutionIdFromLodgements < ActiveRecord::Migration[5.2]
  def change
    remove_column :lodgements, :financial_institution_id, :integer
  end
end
