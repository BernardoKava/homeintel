class CreateAddresspools < ActiveRecord::Migration[5.2]
  def change
    create_table :addresspools do |t|
      t.string :address
      t.boolean :active
      t.integer :user_id

      t.timestamps
    end
  end
end
