class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :item
      t.string :details
      t.datetime :close
      t.integer :reserve
      t.resources :user

      t.timestamps
    end
  end
end
