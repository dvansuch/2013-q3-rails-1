class Transaction < ActiveRecord::Base
  belongs_to :account

  validates :account_id, presence: true
  validates :date,       presence: true
  validates :memo,       presence: true
  validates :amount,     presence: true
end
