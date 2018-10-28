class CreateEmployerpools < ActiveRecord::Migration[5.2]
  def change
    create_table :employerpools do |t|
      t.string :employer
      t.string :sector
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
