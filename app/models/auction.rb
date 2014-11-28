class Auction < ActiveRecord::Base
  include RailsLegit
  include AASM

  belongs_to :user
  has_many :bids

  validates :item, presence: true
  validates :close_time, verify_date: { after: Date.current }
  validates :reserve, numericality: {greater_than: 0}

  aasm whiny_transactions: false do
    state :pending, initial: true
    state :reserve_met

    event :clear_reserve do
      transitions from: :pending, to: :reserve_met
    end 
  end

  def highest_price
    bids.order(price: :desc).first
  end

end
