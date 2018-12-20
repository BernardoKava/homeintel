class CreateLoanManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_managements do |t|
      t.string :year
      t.string :month
      t.integer :loan_registration_id
      t.date :payment_date
      t.numeric :amount
      t.text :note
      t.integer :user_id

      t.timestamps
    end
  end
end
