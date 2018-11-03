class DropInflowTypes < ActiveRecord::Migration[5.2]
  def change
    drop_table :inflow_types
  end
end
