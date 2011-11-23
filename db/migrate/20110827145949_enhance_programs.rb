class EnhancePrograms < ActiveRecord::Migration
  def self.up
		change_column :programs, :code, :string, :null => false, :limit => 15
		change_column :programs, :name, :string, :limit => 63
  end

  def self.down
  end
end
