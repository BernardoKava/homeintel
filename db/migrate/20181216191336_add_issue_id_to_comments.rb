class AddIssueIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :issue_management_id, :integer
  end
end
