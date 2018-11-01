class AddDobToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :dob, :date
  end
end
