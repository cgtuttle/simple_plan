class AddColumnsToDealDetails < ActiveRecord::Migration
  def change
    add_column :deal_details, :start_date, :datetime
    add_column :deal_details, :end_date, :datetime
  end
end
