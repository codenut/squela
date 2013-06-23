class CreateWorkitemTypes < ActiveRecord::Migration
  def self.up
    create_table :workitem_types do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    WorkitemType.create :name => "Story"
    WorkitemType.create :name => "Task"
    WorkitemType.create :name => "Defect"
  end

  def self.down
    drop_table :workitem_types
  end
end
