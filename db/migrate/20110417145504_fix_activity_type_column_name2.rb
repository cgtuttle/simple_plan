class FixActivityTypeColumnName2 < ActiveRecord::Migration
  def self.up
		rename_column :activities, :activity_type, :name
  end

  def self.down
  end
end
