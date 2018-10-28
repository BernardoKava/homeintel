class AddAddresspoolIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :addrespool_id, :integer
  end
end
