class AddOutstandingToLoanRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :loan_registrations, :outstanding, :numeric
  end
end
