class AddPersonIdToCashflowRecons < ActiveRecord::Migration[5.2]
  def change
    add_column :cashflow_recons, :person_id, :integer
  end
end
