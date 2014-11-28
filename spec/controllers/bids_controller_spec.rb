require 'rails_helper'

RSpec.describe BidsController, :type => :controller do
  describe '#create' do
    let(:auction) { create(:auction) }
    let(:user) { create(:user) }

    context 'with a wild user' do
      it 'redirects' do
        post :create, auction_id: auction.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with a legit user' do
      it 'creates a post' do
        def valid_request
          post :create, auction_id: auction.id, bid: attributes_for(:bid)
          expect { valid_request }.to change {Bid.count}
        end
      end
    end
  end

  describe '#index' do
    let(:auction) { create(:auction) }
    let(:user) { create(:user) }
    let(:bid) { create(:bid) }

    context 'with a wild user' do
      it 'redirects' do
        get :index, auction_id: auction.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with a legit user' do
      it 'assigns the the bids made by that user' do
        login(user)
        get :index, auction_id: auction.id
        bid.user = user
        bid.save
        expect(assigns(:bids)).to eq(user.bids)
      end
    end
  end
end
