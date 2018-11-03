class CreateOutflowtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :outflowtypes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
