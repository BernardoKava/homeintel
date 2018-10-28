class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :owner
      t.string :type
      t.numeric :amount
      t.text :details
      t.integer :user_id
      t.integer :budget_id

      t.timestamps
    end
  end
end
