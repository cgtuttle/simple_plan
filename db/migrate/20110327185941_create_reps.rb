class CreateReps < ActiveRecord::Migration
  def self.up
    create_table :reps do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :reps
  end
end
