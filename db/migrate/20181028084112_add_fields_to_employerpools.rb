class AddFieldsToEmployerpools < ActiveRecord::Migration[5.2]
  def change
    add_column :employerpools, :address, :string
    add_column :employerpools, :email, :string
    add_column :employerpools, :telephone, :string
  end
end
