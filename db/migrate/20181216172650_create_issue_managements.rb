class CreateIssueManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :issue_managements do |t|
      t.string :issue_title
      t.text :description
      t.string :completion_rate
      t.integer :person_id
      t.integer :user_id
      t.date :completion_target_date
      t.date :completion_actual_date

      t.timestamps
    end
  end
end
