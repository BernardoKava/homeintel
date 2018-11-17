class AddInstitutionCodeToFinancialinstitutions < ActiveRecord::Migration[5.2]
  def change
    add_column :financialinstitutions, :institution_code, :string
  end
end
