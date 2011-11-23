class ChangeProgramRepField < ActiveRecord::Migration
  def self.up
		rename_column :programs, :rep_id, :seller_id
  end

  def self.down
  end
end
