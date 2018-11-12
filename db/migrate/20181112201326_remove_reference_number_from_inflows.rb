class RemoveReferenceNumberFromInflows < ActiveRecord::Migration[5.2]
  def change
    remove_column :inflows, :reference_number, :integer
  end
end
