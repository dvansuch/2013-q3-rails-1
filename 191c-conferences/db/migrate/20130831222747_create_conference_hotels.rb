class CreateConferenceHotels < ActiveRecord::Migration
  def change
    create_table :conference_hotels, id: false do |t|
      t.integer :conf_id
      t.integer :hotel_id
    end
  end
end
