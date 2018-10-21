class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :inventory, foreign_key: true
      t.string :item
      t.text :description
      t.numeric :quantity
      t.numeric :value
      t.string :owner

      t.timestamps
    end
  end
end
