class AddLastBudgetToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :last_budget, :integer
  end
end
