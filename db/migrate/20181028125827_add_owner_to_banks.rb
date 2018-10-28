class AddOwnerToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :owner, :string
  end
end
