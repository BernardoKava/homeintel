class RenameInfowtypeToInflowtype < ActiveRecord::Migration[5.2]
  def change
    rename_table :infowtypes, :inflowtypes
  end
end
