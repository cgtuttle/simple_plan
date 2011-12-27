class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :profile_id
      t.string :type, :limit => 63
      t.string :model_name
      t.string :view_name
      t.string :column_name
      t.string :value

      t.timestamps
    end
  end
end
