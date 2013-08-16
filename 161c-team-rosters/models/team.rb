class Team < ActiveRecord::Base
  validates :color, presence: true, uniqueness: true

  has_many :members
end
