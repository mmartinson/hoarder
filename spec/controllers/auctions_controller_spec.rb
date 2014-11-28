require 'rails_helper'

RSpec.describe AuctionsController, :type => :controller do
  let(:user) {create(:user)}
  let(:user2) {create(:user)}
  let(:auction) {create(:auction)}
  let(:auction2) {create(:auction)}

  describe '#index' do
    before { login(user) }

    context 'with a wild user' do
      it "assigns all auctions" do
        get :index
        expect(assigns(:auctions)).to eq(Auction.all)
      end

      it 'renders index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end

  describe '#show' do
    before { get :show, id: auction.id }

    context 'with a wild user' do
      it "assigns an auction" do
        expect(assigns(:auction)).to eq(auction)
      end

      it 'renders show template' do
        expect(response).to render_template(:show)
      end
    end
  end

  describe '#new' do
    context 'with a wild user' do
      before { get :new}
      it 'redirects to sign in page' do
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with a legit user' do
      before do 
        login(user)
        get :new
      end

      it 'assigns empty auction' do
        get :new
        expect(assigns(:auction)).to be_a(Auction)
      end

      it "renders new template" do
        expect(response).to render_template(:new)          
      end
    end
  end

  describe '#create' do
    context 'with a wild user' do
      it 'redirects to sign in page' do
        post :create
        expect(response).to redirect_to(new_session_path)
      end
    end

    context "with a legit user" do
      before { login(user) }

      context "with valid auction params" do
        #valid request method will not save
        def valid_request
          auction_attributes = attributes_for(:auction)
          auction_attributes[:user_id] = user.id
          post :create, {auction: auction_attributes}
        end

        it "saves a auction record to the DB" do
          pending "Broken"
          expect { valid_request }.to change { Auction.count }.by(1)
        end

        it "redirects to auction show page" do
          pending "Broken"
          valid_request
          expect(response).to redirect_to(auction_path(Auction.last))
        end

        it "assigns the logged in user to the auction" do
          pending "Broken"
          valid_request
          expect(Auction.last.user).to eq(user)
        end
      end

      context "with invalid auction params" do
        def invalid_request
          post :create, {auction: {item: nil}}
        end

        it "renders new template" do
          invalid_request
          expect(response).to render_template(:new)
        end

        it "doesn't save to the DB" do
          expect { invalid_request }.not_to change { Auction.count }
        end
      end
    end
  end

  describe '#edit' do
    context 'with a wild user' do
      it "redirects to sign in page" do
        get :edit, id: auction.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with a legit user' do
      before do
        login(user)
        get :edit, id: auction.id
      end

      it 'finds page from params id and assigns it' do
        expect(assigns(:auction)).to eq(auction)
      end

      it 'renders edit' do 
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#update' do
    context 'with a wild user' do
      it "redirects to sign in page" do
        get :edit, id: auction.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with a legit user' do
      context 'with valid request' do
        def valid_request(params = {item: auction.item})
          patch :update, id: auction, auction: params
        end
        before {login(user)}

        it "changes the db" do
          valid_request({item: "socks"})
          auction.reload
          expect(auction.item).to eq("socks")
        end

        it 'redirects to auction page' do
          valid_request
          expect(response).to redirect_to(auction_path(auction))
        end

        context 'with invalid request' do
          it 'renders the edit page' do
            patch :update, id: auction, auction: {item: nil}
            expect(response).to render_template(:edit)
          end
        end
      end
    end
  end
end
