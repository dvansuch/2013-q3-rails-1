class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :hotel_name
    end
  end
end
