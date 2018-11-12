class AddReferenceNumberToInflows < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :reference_number, :integer
  end
end
