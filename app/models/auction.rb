class Auction < ActiveRecord::Base
  include RailsLegit
  belongs_to :user
  has_many :bids

  validates :item, presence: true
  # validates :close, verify_date: { after: Date.current }
  validates :reserve, numericality: {greater_than: 0}

end
