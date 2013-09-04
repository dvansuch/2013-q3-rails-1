class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :conf_name
      t.integer :venue_id

    end
  end
end
