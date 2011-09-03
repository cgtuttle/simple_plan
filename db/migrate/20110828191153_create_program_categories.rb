class CreateProgramCategories < ActiveRecord::Migration
  def self.up
    create_table :program_categories do |t|
      t.integer :program_id
      t.integer :category_id
      t.float :budget_rate
      t.float :vol_alloc

      t.timestamps
    end
  end

  def self.down
    drop_table :program_categories
  end
end
