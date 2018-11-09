class AddDatePostedToLodgements < ActiveRecord::Migration[5.2]
  def change
    add_column :lodgements, :date_posted, :date
  end
end
