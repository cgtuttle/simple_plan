class RenameBudgetPlans < ActiveRecord::Migration
  def up
		rename_table :budget_plans, :budgets_plans
  end

  def down
  end
end
