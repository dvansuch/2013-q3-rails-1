class Author < ActiveRecord::Base
	validates :username, presence:true
	validates :username, uniqueness: true
end
