class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :guest_id
      t.integer :conf_id
      t.integer :hotel_id
      t.string :price_paid

    end
  end
end
