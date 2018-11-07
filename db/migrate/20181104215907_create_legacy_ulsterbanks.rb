class CreateLegacyUlsterbanks < ActiveRecord::Migration[5.2]
  def change
    create_table :legacy_ulsterbanks do |t|
      t.date :trans_date
      t.string :trans_type
      t.string :description
      t.numeric :trans_value
      t.string :account_name
      t.string :account_number

      t.timestamps
    end
  end
end
