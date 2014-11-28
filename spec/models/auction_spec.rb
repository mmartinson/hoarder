require 'rails_helper'

RSpec.describe Auction, :type => :model do
  let(:auction) {create(:auction)}
  describe 'validation' do

    it 'passes when it has an item' do
      expect(auction).to be_valid
    end

    it 'fails without an item' do
      auction.item = nil
      expect(auction).to be_invalid
    end
  end
end
