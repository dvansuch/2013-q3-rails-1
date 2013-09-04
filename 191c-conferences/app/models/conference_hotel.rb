class ConferenceHotel < ActiveRecord::Base
	belongs_to :conference 
	belongs_to :hotel
end
