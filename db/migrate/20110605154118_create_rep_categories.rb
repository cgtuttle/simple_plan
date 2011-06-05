class CreateRepCategories < ActiveRecord::Migration
  def self.up
    create_table :rep_categories do |t|
      t.integer :rep_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rep_categories
  end
end
