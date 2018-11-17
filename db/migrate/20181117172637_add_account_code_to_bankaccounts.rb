class AddAccountCodeToBankaccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :bankaccounts, :account_code, :string
  end
end
