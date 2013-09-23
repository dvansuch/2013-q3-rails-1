class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.string :role_name
      t.integer :actor_id
      t.integer :play_id

      t.timestamps
    end
  end
end
