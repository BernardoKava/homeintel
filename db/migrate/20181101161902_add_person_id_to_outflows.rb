class AddPersonIdToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :person_id, :integer
  end
end
