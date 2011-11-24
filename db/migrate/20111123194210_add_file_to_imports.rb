class AddFileToImports < ActiveRecord::Migration
  def change
    add_column :imports, :file, :string
  end
end
