class DestroyEmployersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :employers
  end
end
