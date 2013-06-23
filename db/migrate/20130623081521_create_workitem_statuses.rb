class CreateWorkitemStatuses < ActiveRecord::Migration
  def self.up
    create_table :workitem_statuses do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    WorkitemStatus.create :name => "New"
    WorkitemStatus.create :name => "In Progress"
    WorkitemStatus.create :name => "Done"
  end

  def self.down
    drop_table :workitem_statuses
  end
end
