require 'rails_helper'

RSpec.describe Auction, :type => :model do
  let(:auction) {create(:auction)}
  describe 'validation' do

    it 'passes with default factory build' do
      expect(auction).to be_valid
    end

    it 'fails without an item' do
      auction.item = nil
      expect(auction).to be_invalid
    end

    it 'fails if reserve is not greater than zero' do
      auction.reserve = 0
      expect(auction).to be_invalid
    end

    it 'fails if close time is not in the future' do
      auction.close_time = Time.now
      expect(auction).to be_invalid
    end
  end

  describe '#clear_reserve' do
    it 'changes aasm state to reserve met' do
      auction.clear_reserve
      expect(auction.aasm_state).to eq("reserve_met")
    end
  end
end
