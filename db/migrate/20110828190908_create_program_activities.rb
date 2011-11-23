class CreateProgramActivities < ActiveRecord::Migration
  def self.up
    create_table :program_activities do |t|
      t.integer :program_id
      t.integer :activity_id
      t.float :budget_rate
      t.float :vol_alloc

      t.timestamps
    end
  end

  def self.down
    drop_table :program_activities
  end
end
