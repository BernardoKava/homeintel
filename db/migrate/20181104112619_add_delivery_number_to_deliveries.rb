class AddDeliveryNumberToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :delivery_number, :string
  end
end
