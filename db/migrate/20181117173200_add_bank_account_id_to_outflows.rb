class AddBankAccountIdToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :bankaccount_id, :integer
  end
end
