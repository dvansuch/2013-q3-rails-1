class WorldCities < ActiveRecord::Migration
  def up
  	create_table :world_cities do |t|
  		t.string :name
  		t.string :country
  		t.string :flag
  		t.integer :time_zone
  		t.float :population
  	end
  end

  def down
  	drop_table :world_cities
  end
end
