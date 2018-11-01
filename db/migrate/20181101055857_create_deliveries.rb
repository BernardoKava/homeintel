class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.date :delivery_date
      t.integer :user_id
      t.string :owner

      t.timestamps
    end
  end
end
