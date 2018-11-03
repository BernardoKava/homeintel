class AddLedgerNumberToLedgers < ActiveRecord::Migration[5.2]
  def change
    add_column :ledgers, :ledger_number, :string
  end
end
