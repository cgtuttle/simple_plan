class RenameColumnInImport < ActiveRecord::Migration
  def up
		rename_column :cells, :cell_value, :value
  end

  def down
		rename_column :cells, :value, :cell_value
  end
end
