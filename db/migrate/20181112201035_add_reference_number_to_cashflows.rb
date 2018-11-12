class AddReferenceNumberToCashflows < ActiveRecord::Migration[5.2]
  def change
    add_column :cashflows, :reference_number, :integer
  end
end
