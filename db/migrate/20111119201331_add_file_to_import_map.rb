class AddFileToImportMap < ActiveRecord::Migration
  def change
		add_column :import_maps, :full_filename, :string
  end
end
