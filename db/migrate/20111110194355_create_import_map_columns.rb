class CreateImportMapColumns < ActiveRecord::Migration
  def change
    create_table :import_map_columns do |t|
      t.integer :import_map_id
      t.string :table_column
      t.boolean :is_required
      t.boolean :import
      t.string :import_column

      t.timestamps
    end
  end
end
