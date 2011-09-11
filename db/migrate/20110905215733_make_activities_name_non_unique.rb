class MakeActivitiesNameNonUnique < ActiveRecord::Migration
  def self.up
		remove_index :activities, :type
  end

  def self.down
  end
end
