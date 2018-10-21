class Dropinventories < ActiveRecord::Migration[5.2]
  def change
    drop_table :inventories
  end
end
