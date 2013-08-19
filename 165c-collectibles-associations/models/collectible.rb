class Collectible < ActiveRecord::Base
	belongs_to :category
	belongs_to :episode
end
