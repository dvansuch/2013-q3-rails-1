class Reservation < ActiveRecord::Base
	belongs_to :guest
	has_one :conference, class_name: "Conference", foreign_key: "conf_id"
	has_one :hotel, class_name: "Hotel", foreign_key: "hotel_id"
	has_one :guest, class_name: "Guest", foreign_key: "guest_id"
end
