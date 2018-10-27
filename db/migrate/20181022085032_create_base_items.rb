class CreateBaseItems < ActiveRecord::Migration[5.2]
  def change
    create_table :base_items do |t|
      t.string :name
      t.text :description
      t.string :owner
      t.boolean :active
      t.integer :user_id

      t.timestamps
    end
  end
end
