class CreateYeartitles < ActiveRecord::Migration[5.2]
  def change
    create_table :yeartitles do |t|
      t.string :name

      t.timestamps
    end
  end
end
