class AddAssignmentTables < ActiveRecord::Migration
  def up
		create_table :category_assignments do |t|
			t.integer	:category_id
			t.integer	:partner_id
		end		
  end

  def down
		drop_table	:category_assignments
  end
end
