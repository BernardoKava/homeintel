class AddColumnTransactionValueToLegacyUlsterbanks < ActiveRecord::Migration[5.2]
  def change
    add_column :legacy_ulsterbanks, :transaction_value, :numeric
  end
end
