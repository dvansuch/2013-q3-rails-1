class Member < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :team_id, presence: true

  belongs_to :team
end
