class DropCategoryAssignments < ActiveRecord::Migration
  def up
		drop_table :category_assignments
  end

  def down
  end
end
