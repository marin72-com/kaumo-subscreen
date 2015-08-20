class CreatePushes < ActiveRecord::Migration
  def change
    create_table :pushes do |t|
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    
    add_index :pushes, :user_id
  end
end
