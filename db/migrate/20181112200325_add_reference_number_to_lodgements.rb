class AddReferenceNumberToLodgements < ActiveRecord::Migration[5.2]
  def change
    add_column :lodgements, :reference_number, :integer
  end
end
