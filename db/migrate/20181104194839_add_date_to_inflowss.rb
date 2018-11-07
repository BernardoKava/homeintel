class AddDateToInflowss < ActiveRecord::Migration[5.2]
  def change
    add_column :inflows, :bank_record_date, :date
  end
end
