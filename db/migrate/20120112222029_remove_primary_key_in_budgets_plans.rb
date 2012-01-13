class RemovePrimaryKeyInBudgetsPlans < ActiveRecord::Migration
  def up
		remove_column :budgets_plans, :id
  end

  def down
  end
end
