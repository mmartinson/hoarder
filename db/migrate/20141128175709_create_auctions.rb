class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :item
      t.string :details
      t.datetime :close
      t.integer :reserve
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
