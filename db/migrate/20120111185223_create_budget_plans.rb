class CreateBudgetPlans < ActiveRecord::Migration
  def change
    create_table :budget_plans do |t|
      t.integer :budget_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
