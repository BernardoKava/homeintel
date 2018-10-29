class CreateWithdrawals < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrawals do |t|
      t.string :owner
      t.numeric :amount
      t.text :details
      t.integer :user_id
      t.integer :saving_id
      t.string :institution

      t.timestamps
    end
  end
end
