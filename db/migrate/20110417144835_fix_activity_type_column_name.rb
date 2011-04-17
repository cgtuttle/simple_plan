class FixActivityTypeColumnName < ActiveRecord::Migration
  def self.up
		rename_column :activities, :type, :activity_type
  end

  def self.down
  end
end
