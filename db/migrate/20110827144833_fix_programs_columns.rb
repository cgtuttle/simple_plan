class FixProgramsColumns < ActiveRecord::Migration
  def self.up
		remove_column :programs, :customer_id
		add_column :programs, :owner_id, :integer
		add_column :programs, :budget_rate, :float
		add_column :programs, :budget_vol, :float
		add_column :programs, :plan_rate, :float
		add_column :programs,	:plan_vol,	:float
  end

  def self.down
  end
end
