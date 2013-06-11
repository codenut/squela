class CreateWorkitems < ActiveRecord::Migration
  def self.up
    create_table :workitems do |t|
      
      t.boolean :is_deleted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :workitems
  end
end
