class Order < ActiveRecord::Base
  has_many :line_items
  has_many :dishes, through: :line_items
end
