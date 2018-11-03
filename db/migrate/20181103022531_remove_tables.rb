class RemoveTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :year_titles
    drop_table :month_titles
    drop_table :outflow_types
    drop_table :financial_institutions

  end
end
