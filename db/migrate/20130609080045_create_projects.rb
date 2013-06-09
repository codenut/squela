class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.string :description
      t.boolean :is_deleted
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
