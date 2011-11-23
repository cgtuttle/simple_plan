class CreateImportMaps < ActiveRecord::Migration
  def change
    create_table :import_maps do |t|
      t.string :code
      t.string :name
      t.string :model_name
      t.integer :account_id
      t.integer :user_id

      t.timestamps
    end
  end
end
