class CreateCorrectiveActions < ActiveRecord::Migration[5.2]
  def change
    create_table :corrective_actions do |t|
      t.string :title
      t.integer :issue_management_id
      t.date :target_completion_date
      t.date :actual_completion_date
      t.string :description
      t.integer :person_id
      t.integer :user_id

      t.timestamps
    end
  end
end
