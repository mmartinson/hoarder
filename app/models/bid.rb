class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user

  def created_by
    user.username
  end

  def for
    auction.item
  end
end
