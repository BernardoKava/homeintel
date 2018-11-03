class RemoveMoreTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :inflowtypes
  end
end
