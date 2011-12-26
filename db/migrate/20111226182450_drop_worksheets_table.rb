class DropWorksheetsTable < ActiveRecord::Migration
  def up
		drop_table :worksheets
  end

  def down
  end
end
