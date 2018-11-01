class RemoveOwnerFromDeliveries < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :owner, :string
  end
end
