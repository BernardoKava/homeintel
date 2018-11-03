class AddInflowtypeIdToInflows < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :inflowtype_id, :integer
  end
end
