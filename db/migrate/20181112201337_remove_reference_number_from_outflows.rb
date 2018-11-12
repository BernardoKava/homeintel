class RemoveReferenceNumberFromOutflows < ActiveRecord::Migration[5.2]
  def change
    remove_column :outflows, :reference_number, :integer
  end
end
