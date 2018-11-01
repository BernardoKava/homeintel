class AddReceiverToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :receiver, :string
  end
end
