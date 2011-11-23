class DestroyRepCategories < ActiveRecord::Migration
  def self.up
		drop_table :rep_categories
  end

  def self.down
  end
end
