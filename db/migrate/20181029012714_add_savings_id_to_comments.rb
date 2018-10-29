class AddSavingsIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :saving_id, :integer
  end
end
