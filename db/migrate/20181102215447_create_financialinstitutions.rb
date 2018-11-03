class CreateFinancialinstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :financialinstitutions do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :telephone
      t.string :email
      t.float  :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
