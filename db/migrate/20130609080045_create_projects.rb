class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.string :description
      t.boolean :is_deleted, :default => false
      t.timestamps
    end

    Project.create :name => 'Test Project', :url => 'http://squela.com', :description => 'This is a test'
  end

  def self.down
    drop_table :projects
  end
end
