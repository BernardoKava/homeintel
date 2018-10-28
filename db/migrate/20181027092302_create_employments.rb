class CreateEmployments < ActiveRecord::Migration[5.2]
  def change
    create_table :employments do |t|
      t.string :company
      t.string :position
      t.date :from
      t.date :to
      t.text :terminationreason
      t.boolean :actve
      t.integer :person_id
      t.integer :user_id

      t.timestamps
    end
  end
end
