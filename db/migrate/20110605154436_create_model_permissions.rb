class CreateModelPermissions < ActiveRecord::Migration
  def self.up
    create_table :model_permissions do |t|
      t.string :permission_type
      t.string :model
      t.integer :domain_class_id

      t.timestamps
    end
  end

  def self.down
    drop_table :model_permissions
  end
end
