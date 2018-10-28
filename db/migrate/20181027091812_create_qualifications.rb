class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.string :name
      t.string :school
      t.date :from
      t.date :to
      t.string :grade

      t.timestamps
    end
  end
end
