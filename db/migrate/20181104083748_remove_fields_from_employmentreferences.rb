class RemoveFieldsFromEmploymentreferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :employmentreferences, :employer, :string
    remove_column :employmentreferences, :employer_address, :string
    remove_column :employmentreferences, :employer_telephone, :string
    remove_column :employmentreferences, :employer_email, :string
    remove_column :employmentreferences, :employer_description, :string
  end
end
