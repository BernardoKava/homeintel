class CreateInflows < ActiveRecord::Migration[5.2]
  def change
    create_table :inflows do |t|
      t.string :owner
      t.numeric :amount
      t.text :details
      t.string :flow_type
      t.integer :user_id
      t.integer :cashflow_id

      t.timestamps
    end
  end
end
