class AddPersonIdToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :person_id, :integer
  end
end
