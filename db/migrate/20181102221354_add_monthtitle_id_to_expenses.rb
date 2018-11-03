class AddMonthtitleIdToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :monthtitle_id, :integer
  end
end
