class AddActiveAndPersonIdToQualifications < ActiveRecord::Migration[5.2]
  def change
    add_column :qualifications, :active, :boolean
    add_column :qualifications, :person_id, :integer
  end
end
