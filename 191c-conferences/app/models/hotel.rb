class Hotel < ActiveRecord::Base
	has_and_belongs_to_many :conferences, join_table: "conference_hotels", class_name: "Conference", foreign_key: "hotel_id", association_foreign_key: "conf_id"
	has_many :reservations
end
