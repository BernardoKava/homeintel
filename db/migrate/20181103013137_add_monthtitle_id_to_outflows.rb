class AddMonthtitleIdToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :monthtitle_id, :integer
  end
end
