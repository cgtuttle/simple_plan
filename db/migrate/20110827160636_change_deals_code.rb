class ChangeDealsCode < ActiveRecord::Migration
  def self.up
		change_column :deals, :code, :string, :limit => 15
  end

  def self.down
  end
end
