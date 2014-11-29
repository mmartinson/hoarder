class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user
  after_save :update_auction_state

  def created_by
    user.username
  end

  def for
    auction.item
  end

  def update_auction_state
    if price >= auction.reserve && auction.pending?
      auction.clear_reserve!
      return true
    end
    false
  end
end
