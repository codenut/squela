class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :description
      t.integer :user_id
      t.integer :workitem_id

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
