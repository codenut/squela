class CreateStreams < ActiveRecord::Migration
  def self.up
    create_table :streams do |t|
      t.string :json_object
      t.integer :user_id
      t.integer :project_id
      t.string :description
      t.boolean :is_cleared, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :streams
  end
end
