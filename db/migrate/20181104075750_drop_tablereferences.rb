class DropTablereferences < ActiveRecord::Migration[5.2]
  def change
    drop_table :references
  end
end
