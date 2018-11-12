class AddReferenceNumberToSavings < ActiveRecord::Migration[5.2]
  def change
    add_column :savings, :reference_number, :integer
  end
end
