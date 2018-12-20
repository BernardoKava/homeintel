class AddFollowUpToInflows < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :follow_up, :boolean
  end
end
