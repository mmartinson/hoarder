class User < ActiveRecord::Base
  has_secure_password
  has_many :auctions
  has_many :bids
  has_many :auction_bids, through: :auctions, source: :bids

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true #validate format


end
