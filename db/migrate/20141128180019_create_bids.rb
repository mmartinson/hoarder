class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.resources :user, index: true
      t.resources :auction
      t.integer :price

      t.timestamps
    end
  end
end
