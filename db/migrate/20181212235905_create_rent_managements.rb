class CreateRentManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :rent_managements do |t|
      t.string :year
      t.string :month
      t.numeric :amount
      t.date :date_collected
      t.text :details
      t.string :collected_by
      t.integer :user_id

      t.timestamps
    end
  end
end
