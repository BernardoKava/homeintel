class AddFinancialinstitutionIdToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :financialinstitution_id, :integer
  end
end
