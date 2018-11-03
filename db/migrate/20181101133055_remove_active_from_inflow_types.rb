class RemoveActiveFromInflowTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :inflow_types, :active, :boolean
  end
end
