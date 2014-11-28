class AddAasmStateToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :aasm_state, :sting
    add_index :auctions, :aasm_state
  end
end
