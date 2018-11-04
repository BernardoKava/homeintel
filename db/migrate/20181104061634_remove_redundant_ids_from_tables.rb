class RemoveRedundantIdsFromTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :addrespool_id
  end
end
