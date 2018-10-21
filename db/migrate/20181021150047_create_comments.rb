class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :inventory, foreign_key: true
      t.integer :user_id
      t.text :commentary

      t.timestamps
    end
  end
end
