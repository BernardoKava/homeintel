class DropAddresspools < ActiveRecord::Migration[5.2]
  def change
    drop_table :addresspools
    drop_table :banks
    drop_table :schools
    drop_table :base_items
    drop_table :budgetcomments



  end
end
