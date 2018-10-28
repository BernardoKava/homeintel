class AddUserIdToQualifications < ActiveRecord::Migration[5.2]
  def change
    add_column :qualifications, :user_id, :integer
  end
end
