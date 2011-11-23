class ChangeProgramColumnStructure < ActiveRecord::Migration
  def self.up
		rename_column	:programs, :owner_id,	:account_id
  end

  def self.down
		rename_column	:programs,	:account_id, :owner_id
  end
end
