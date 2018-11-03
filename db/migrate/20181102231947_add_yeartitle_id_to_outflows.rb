class AddYeartitleIdToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :yeartitle_id, :integer
  end
end
