require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validation" do
let!(:user) { create(:user) }
let(:user2) { create(:user) }

    it "passes with default factory build" do
      expect(user).to be_valid
    end

    it 'fails without a unique username' do
      user2.username = user.username
      expect(user2).to be_invalid
    end

    it 'fails without an email' do
      user.email = nil
      expect(user).to be_invalid
    end
  end
end
