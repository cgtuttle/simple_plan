class AddColumnsToDeals < ActiveRecord::Migration
  def self.up
		add_column :deals, :name, :string, :limit => 63
		add_column :deals, :descr, :string, :limit => 255
  end

  def self.down
		remove_column :deals, :name
		remove_column :deals, :descr
  end
end
