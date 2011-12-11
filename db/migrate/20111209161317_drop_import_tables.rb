class DropImportTables < ActiveRecord::Migration
  def up
		drop_table :import_maps
		drop_table :import_map_columns
  end

  def down
  end
end
