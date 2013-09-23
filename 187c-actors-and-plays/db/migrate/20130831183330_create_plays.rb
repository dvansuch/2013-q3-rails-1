class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :play_name

      t.timestamps
    end
  end
end
