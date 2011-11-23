class RemovePartnerships < ActiveRecord::Migration
  def self.up
		drop_table	:partnerships
  end

  def self.down
  end
end
