class Actor < ActiveRecord::Base
	has_many :roles
	has_many :plays, through: :roles
end
