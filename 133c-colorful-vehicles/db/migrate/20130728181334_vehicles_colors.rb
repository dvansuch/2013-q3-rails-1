class VehiclesColors < ActiveRecord::Migration
  def up
  	create_table :colors do |t|
  		t.string :name
  		t.string :html_color
  	end

  	create_table :vehicles do |t|
  		t.string :name
  		t.string :image
  	end
  end

  def down
  	drop_table :colors
  	drop_table :vehicles
  end
end
