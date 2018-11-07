class RemoveColumnValueFromLegacyUlsterbanks < ActiveRecord::Migration[5.2]
  def change
    remove_column :legacy_ulsterbanks, :value, :numeric
  end
end
