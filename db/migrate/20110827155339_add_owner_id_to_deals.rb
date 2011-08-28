class AddOwnerIdToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :owner_id, :integer
  end

  def self.down
    remove_column :deals, :owner_id
  end
end
