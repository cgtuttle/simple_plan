class ChangeTypeToTypeNameInSettings < ActiveRecord::Migration
  def up
		rename_column :settings, :type, :type_name
  end

  def down
  end
end
