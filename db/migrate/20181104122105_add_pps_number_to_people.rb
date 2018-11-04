class AddPpsNumberToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :pps_number, :string
  end
end
