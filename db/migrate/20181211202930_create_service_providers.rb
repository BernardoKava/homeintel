class CreateServiceProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :service_providers do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :email
      t.string :acc_number
      t.integer :user_id
      t.boolean :active
      t.string :link

      t.timestamps
    end
  end
end
