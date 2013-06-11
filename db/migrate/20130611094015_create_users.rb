class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :fullname
      t.integer :type_id
      t.integer :role_id
      t.boolean :delete_flag, :default => false
      t.timestamps
    end
  end
end
