class AddDateToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :bank_record_date, :date
  end
end
