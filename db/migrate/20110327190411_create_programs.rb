class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.string :code
      t.string :name
      t.string :descr
      t.integer :supplier_id
      t.integer :category_id
      t.integer :rep_id
      t.integer :customer_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end
end
