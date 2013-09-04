class Conference < ActiveRecord::Base
	has_many :venues, class_name: "Venue", foreign_key: "venue_id"
	has_many :reservations
	has_and_belongs_to_many :hotels, join_table: "conference_hotels", class_name: "Hotel", foreign_key: "conf_id", association_foreign_key: "hotel_id"
	has_many :guests
end
