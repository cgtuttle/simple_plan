class UpdateDealTablesWithBudgetColumns < ActiveRecord::Migration
  def up
		change_table :deal_products do |t|
			t.decimal :plan_rate, :plan_volume, :deal_rate, :deal_volume
			t.decimal :est_volume, :reported_volume, :actual_expense
		end
		
		change_table :deal_activities do |t|
			t.decimal :plan_rate, :plan_vol, :deal_rate, :deal_vol
			t.decimal :est_volume, :reported_volume, :actual_expense
		end
  end

  def down
  end
end
