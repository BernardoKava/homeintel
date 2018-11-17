class AddOriginToInflows < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :origination, :string
    add_column :inflows, :rationale, :text
  end
end
