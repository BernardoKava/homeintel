class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :owner
      t.numeric :amount
      t.string :expense_type
      t.integer :user_id
      t.integer :budget_id
      t.text :details

      t.timestamps
    end
  end
end
