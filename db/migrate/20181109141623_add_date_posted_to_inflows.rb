class AddDatePostedToInflows < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :date_posted, :date
  end
end
