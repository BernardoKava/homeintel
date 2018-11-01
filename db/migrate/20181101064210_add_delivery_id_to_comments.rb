class AddDeliveryIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :delivery_id, :integer
  end
end
