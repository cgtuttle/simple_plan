class TableUpdatesForBudgetColumns < ActiveRecord::Migration
  def up
		change_table :plans do |t|
		  t.rename :budget, :budget_expense
			t.decimal :budget_volume
		end
		
		change_table :programs do |t|
			t.remove :plan_rate, :plan_vol
		end
		
		change_table :deals do |t|
			t.decimal :plan_rate, :plan_volume, :deal_rate, :deal_volume
			t.decimal :est_volume, :actual_expense, :reported_volume
		end
		
  end

  def down
  end
end
