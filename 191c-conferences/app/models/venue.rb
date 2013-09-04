class Venue < ActiveRecord::Base
	belongs_to :conference, class_name: "Conference", foreign_key: "venue_id"
end
