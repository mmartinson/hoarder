class BidsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bids = current_user.bids
  end

  def create
    @auction = Auction.find params[:auction_id]
    @bid = @auction.bids.new(price: @auction.next_bid, user: current_user)
    @bid.save
    respond_to do |format|
      format.js {render :create}
    end
  end

  private

  def get_auction
    @auction = Auction.find params[:auction_id]
  end

end
