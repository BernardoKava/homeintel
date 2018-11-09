class AddDatePostedToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :date_posted, :date
  end
end
