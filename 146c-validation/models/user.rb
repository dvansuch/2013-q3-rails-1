class User < ActiveRecord::Base
	validates :username, presence: true
	validates :username, uniqueness: true
	validates :age, numericality: {only_integer: true}
end
