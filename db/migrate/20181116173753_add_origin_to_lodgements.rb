class AddOriginToLodgements < ActiveRecord::Migration[5.2]
  def change
    add_column :lodgements, :origination, :string
    add_column :lodgements, :rationale, :text
  end
end
