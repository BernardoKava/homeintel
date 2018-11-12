class AddReferenceNumberToLedgers < ActiveRecord::Migration[5.2]
  def change
    add_column :ledgers, :reference_number, :integer
  end
end
