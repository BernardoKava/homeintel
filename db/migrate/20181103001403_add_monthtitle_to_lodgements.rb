class AddMonthtitleToLodgements < ActiveRecord::Migration[5.2]
  def change
    add_column :lodgements, :monthtitle_id, :integer
  end
end
