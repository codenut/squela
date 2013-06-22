class CreateWorkitems < ActiveRecord::Migration
  def self.up
    create_table :workitems do |t|
      t.string :summary
      t.integer :type_id
      t.integer :project_id
      t.integer :points
      t.integer :status_id
      t.integer :priority_id
      t.integer :user_id
      t.string :estimate
      t.string :tags
      t.date :due_date
      t.string :description
      t.boolean :is_deleted, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :workitems
  end
end
