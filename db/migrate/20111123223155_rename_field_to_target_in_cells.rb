class RenameFieldToTargetInCells < ActiveRecord::Migration
  def up
		rename_column :cells, :field, :destination
  end

  def down
  end
end
