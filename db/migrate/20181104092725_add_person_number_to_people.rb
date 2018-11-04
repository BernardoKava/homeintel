class AddPersonNumberToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :person_number, :string
  end
end
