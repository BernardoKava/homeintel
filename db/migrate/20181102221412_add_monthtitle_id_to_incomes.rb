class AddMonthtitleIdToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :monthtitle_id, :integer
  end
end
