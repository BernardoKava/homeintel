class AddFinancialinstitutionIdToLodgements < ActiveRecord::Migration[5.2]
  def change
    add_column :lodgements, :financialinstitution_id, :integer
  end
end
