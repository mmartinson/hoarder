class ChangeAuction < ActiveRecord::Migration
  def change
    rename_column :auctions, :close, :close_time
  end
end
