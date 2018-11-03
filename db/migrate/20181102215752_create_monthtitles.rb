class CreateMonthtitles < ActiveRecord::Migration[5.2]
  def change
    create_table :monthtitles do |t|
      t.string :name

      t.timestamps
    end
  end
end
