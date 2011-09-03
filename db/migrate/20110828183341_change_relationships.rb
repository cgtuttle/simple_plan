class ChangeRelationships < ActiveRecord::Migration
  def self.up
		rename_column :partnerships, :provider_id, :supplier_id
  end

  def self.down
		rename_column :partnerships, :supplier_id, :provider_id
  end
end
