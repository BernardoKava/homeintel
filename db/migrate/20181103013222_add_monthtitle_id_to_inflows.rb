class AddMonthtitleIdToInflows < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :monthtitle_id, :integer
  end
end
