class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :fullname
      t.integer :type_id
      t.integer :role_id
      t.boolean :is_deleted, :default => false
      t.timestamps
    end

    User.create :email => 'mikevalladolid@gmail.com', :password => 'bassist', :fullname => 'Michael Valladolid'
  end

  def self.down
    drop_table :users
  end
end
