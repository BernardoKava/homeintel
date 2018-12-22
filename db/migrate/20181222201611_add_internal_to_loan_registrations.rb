class AddInternalToLoanRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :loan_registrations, :internal_loan, :boolean
  end
end
