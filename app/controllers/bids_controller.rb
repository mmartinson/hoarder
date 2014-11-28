class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_auction

  def index
    @bids = current_user.bids
  end

  def create
    @bid = @auction.bids.new bid_params
    respond_to do |format|
      format.html
      format.json {render json: @bid}
    end
  end

  private

  def get_auction
    @auction = Auction.find params[:auction_id]
  end

  def bid_params
    params.require(:bid).permit(price)
  end

end
