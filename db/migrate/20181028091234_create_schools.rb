class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :telephone
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
