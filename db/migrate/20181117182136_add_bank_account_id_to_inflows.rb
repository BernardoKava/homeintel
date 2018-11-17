class AddBankAccountIdToInflows < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :bankaccount_id, :integer
  end
end
