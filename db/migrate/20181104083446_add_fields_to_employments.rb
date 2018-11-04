class AddFieldsToEmployments < ActiveRecord::Migration[5.2]
  def change
    add_column :employments, :company_address, :string
    add_column :employments, :company_telephone, :string
    add_column :employments, :company_email, :string
    add_column :employments, :company_details, :text
  end
end
