class AddSavingNumberToSavings < ActiveRecord::Migration[5.2]
  def change
    add_column :savings, :saving_number, :string
  end
end
