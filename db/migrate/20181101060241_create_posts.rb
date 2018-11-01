class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :post_type
      t.text :description
      t.string :signed_for_by
      t.boolean :scanned
      t.integer :user_id
      t.integer :delivery_id

      t.timestamps
    end
  end
end
