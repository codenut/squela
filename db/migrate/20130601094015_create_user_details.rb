class CreateUserDetails < ActiveRecord::Migration
  def self.up
    create_table :user_details do |t|
      t.integer :user_id
      t.string :fullname
      t.integer :type_id
      t.integer :role_id
      t.timestamps
    end
  end

  def self.down
    drop_table :users_details
  end
end
