class ModifyDealsCode < ActiveRecord::Migration
  def self.up
		change_column :deals, :code, :integer, :null => false
  end

  def self.down
		change_column :deals, :code, :integer, :null => true
  end
end
