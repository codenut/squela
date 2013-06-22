class CreatePriorities < ActiveRecord::Migration
  def self.up
    create_table :priorities do |t|
      t.string :name 
      t.string :description
      t.timestamps
    end

    Priority.create :name => :Low
    Priority.create :name => :Normal
    Priority.create :name => :High
  end

  def self.down
    drop_table :priorities
  end
end
