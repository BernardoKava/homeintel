class RemoveFinancialInstitutionIdFromOutflows < ActiveRecord::Migration[5.2]
  def change
    remove_column :outflows, :financialinstitution_id, :integer
  end
end
