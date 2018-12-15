class AddNoteToLedgers < ActiveRecord::Migration[5.2]
  def change
    add_column :ledgers, :note, :text
  end
end
