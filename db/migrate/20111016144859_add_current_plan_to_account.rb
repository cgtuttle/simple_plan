class AddCurrentPlanToAccount < ActiveRecord::Migration
  def change
		add_column	:accounts,	:current_plan,	:integer
  end
end
