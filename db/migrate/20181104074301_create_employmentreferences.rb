class CreateEmploymentreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :employmentreferences do |t|
      t.string :employer
      t.string :employer_address
      t.string :employer_telephone
      t.string :employer_email
      t.string :employer_description
      t.string :referee_name
      t.string :referee_telephone
      t.string :referee_email
      t.text :referee_details
      t.integer :person_id
      t.boolean :referee_active
      t.integer :user_id

      t.timestamps
    end
  end
end
