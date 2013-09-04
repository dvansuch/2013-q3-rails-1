class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :venue_name

    end
  end
end
