class RemoveFileFromImports < ActiveRecord::Migration
  def up
		remove_column :imports, :file
  end

  def down
  end
end
