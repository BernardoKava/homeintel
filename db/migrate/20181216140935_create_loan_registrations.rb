class CreateLoanRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_registrations do |t|
      t.integer :financialinstitution_id
      t.string :loan_type
      t.string :loan_term
      t.text :rationale
      t.numeric :amount
      t.string :loan_reference
      t.date :drawdown_date
      t.date :final_payment_date
      t.integer :user_id
      t.integer :person_id

      t.timestamps
    end
  end
end
