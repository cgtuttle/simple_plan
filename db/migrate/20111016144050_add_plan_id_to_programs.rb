class AddPlanIdToPrograms < ActiveRecord::Migration
  def change
		add_column	:programs,	:plan_id,	:integer
  end
end
