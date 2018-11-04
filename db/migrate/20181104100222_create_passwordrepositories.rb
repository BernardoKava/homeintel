class CreatePasswordrepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :passwordrepositories do |t|
      t.string :system_name
      t.string :system_password
      t.boolean :active

      t.timestamps
    end
  end
end
