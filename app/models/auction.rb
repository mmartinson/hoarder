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

  def highest_bid
    bids.order(price: :desc).first
  end

  def highest_bid_price
    highest_bid.try(:price)
  end

  def next_bid
    highest_bid ? 1 + highest_bid.price : 1
  end

  def reverse_bids 
    bids.order(price: :desc)
  end

end
