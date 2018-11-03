class AddYeartitleIdToLodgements < ActiveRecord::Migration[5.2]
  def change
    add_column :lodgements, :yeartitle_id, :integer
  end
end
