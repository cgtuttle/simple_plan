class AddLastPlanToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :last_plan, :integer
  end
end
