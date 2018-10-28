class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :email
      t.integer :user_id
      t.boolean :active
      t.integer :person_id

      t.timestamps
    end
  end
end
