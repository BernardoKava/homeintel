class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :user_id
      t.boolean :active
      t.integer :person_id

      t.timestamps
    end
  end
end
