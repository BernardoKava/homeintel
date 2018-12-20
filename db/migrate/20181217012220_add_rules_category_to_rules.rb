class AddRulesCategoryToRules < ActiveRecord::Migration[5.2]
  def change
    add_column :rules, :rules_category_id, :integer
  end
end
