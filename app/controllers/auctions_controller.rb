class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_auction, only: [:show, :edit, :update]

  def index
    @auctions = Auction.all
    @auction = Auction.new
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = current_user.auctions.new auction_params
    if @auction.save
      redirect_to auction_path(@auction)
    else
      flash[:alert] = 'Try again'
      redirect_to auctions_path
    end
  end

  def show; end

  def edit; end

  def update
    if @auction.update_attributes auction_params
      redirect_to auction_path(@auction)
    else
      flash.now[:alert] = 'Try again'
      render :edit
    end
  end

  private

  def get_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:item, :details, :close_date, :reserve, :aasm_state)
  end
end
