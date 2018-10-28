class CreateTelephones < ActiveRecord::Migration[5.2]
  def change
    create_table :telephones do |t|
      t.string :phone
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
