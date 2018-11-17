class AddOriginToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :origination, :string
    add_column :outflows, :rationale, :text
  end
end
