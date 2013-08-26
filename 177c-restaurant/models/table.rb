class Table < ActiveRecord::Base
  has_many :orders
  validates :number_of_chairs, presence: true
end
