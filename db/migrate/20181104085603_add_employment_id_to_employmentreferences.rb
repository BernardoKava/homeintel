class AddEmploymentIdToEmploymentreferences < ActiveRecord::Migration[5.2]
  def change
    add_column :employmentreferences, :employment_id, :integer
  end
end
