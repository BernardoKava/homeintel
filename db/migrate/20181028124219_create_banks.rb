class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :address
      t.integer :user_id
      t.string :iban
      t.string :bic
      t.text :accessibility
      t.boolean :active

      t.timestamps
    end
  end
end
