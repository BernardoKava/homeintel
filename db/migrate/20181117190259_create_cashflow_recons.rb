class CreateCashflowRecons < ActiveRecord::Migration[5.2]
  def change
    create_table :cashflow_recons do |t|
      t.integer :cashflow_id
      t.integer :user_id
      t.text :error_details
      t.text :reconciliation_rationale
      t.numeric :correction_amount
      t.string :authorised_by
      t.date :authorisation_date

      t.timestamps
    end
  end
end
