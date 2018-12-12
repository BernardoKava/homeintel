class AddPolicyCodeToRules < ActiveRecord::Migration[5.2]
  def change
    add_column :rules, :policy_code, :string
  end
end
