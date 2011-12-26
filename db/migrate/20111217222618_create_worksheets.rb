class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.integer :user_id
      t.string :seller_name
      t.string :customer_name
      t.string :program_code
      t.date :program_start
      t.date :program_end
			

      t.timestamps
    end
  end
end
