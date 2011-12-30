class AddCategoryIdToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :category_id, :integer
  end
end
