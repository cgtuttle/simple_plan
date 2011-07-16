class AddFieldsToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
  end

  def self.down
    remove_column :profiles, :last_name
    remove_column :profiles, :first_name
  end
end
