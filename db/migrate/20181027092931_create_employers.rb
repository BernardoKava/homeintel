class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :sector
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
