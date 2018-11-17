class CreateBankaccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bankaccounts do |t|
      t.integer :financialinstitution_id
      t.string :account_number
      t.string :sort_code
      t.string :iban
      t.string :bic
      t.integer :person_id

      t.timestamps
    end
  end
end
