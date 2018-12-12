class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :category
      t.string :title
      t.text :definition
      t.boolean :active
      t.integer :user_id

      t.timestamps
    end
  end
end
