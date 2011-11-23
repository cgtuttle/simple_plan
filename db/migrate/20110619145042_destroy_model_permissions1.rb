class DestroyModelPermissions1 < ActiveRecord::Migration
  def self.up
		drop_table :model_permissions
  end

  def self.down
  end
end
