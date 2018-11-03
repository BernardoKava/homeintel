class CreateInflowtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :inflowtypes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
