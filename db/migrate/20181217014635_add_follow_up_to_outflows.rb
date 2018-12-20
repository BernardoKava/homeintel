class AddFollowUpToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :follow_up, :boolean
  end
end
