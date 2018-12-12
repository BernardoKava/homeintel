class RemovePolicyCodeFromRules < ActiveRecord::Migration[5.2]
  def change
    remove_column :rules, :policy_code, :number
  end
end
