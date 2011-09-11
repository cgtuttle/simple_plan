class RenamePartnersToPartnerships < ActiveRecord::Migration
  def self.up
		rename_table	:partners, :partnerships
  end

  def self.down
		rename_table	:partnerships,	:partners
  end
end
