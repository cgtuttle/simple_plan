class ChangeValueToSettingValue < ActiveRecord::Migration
  def up
		rename_column :settings, :value, :setting_value
  end

  def down
  end
end
