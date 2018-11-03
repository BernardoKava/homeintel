class AddYeartitleIdToInflows < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :yeartitle_id, :integer
  end
end
