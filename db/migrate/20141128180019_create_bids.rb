class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id, index: true
      t.integer :auction_id, index: true
      t.integer :price

      t.timestamps
    end
  end
end
