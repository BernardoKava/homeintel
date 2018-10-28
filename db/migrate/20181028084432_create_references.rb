class CreateReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :references do |t|
      t.string :employer
      t.string :referee
      t.string :telephone
      t.string :email
      t.text :details
      t.integer :person_id
      t.boolean :active

      t.timestamps
    end
  end
end
