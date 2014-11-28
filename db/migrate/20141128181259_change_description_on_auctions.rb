class ChangeDescriptionOnAuctions < ActiveRecord::Migration
  def change
    remove_column :auctions, :details
    add_column :auctions, :details, :text
  end
end
