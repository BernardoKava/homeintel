class RemoveReferenceNumberFromLodgements < ActiveRecord::Migration[5.2]
  def change
    remove_column :lodgements, :reference_number, :integer
  end
end
