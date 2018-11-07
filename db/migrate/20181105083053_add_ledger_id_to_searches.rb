class AddLedgerIdToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :ledger_id, :integer
  end
end
