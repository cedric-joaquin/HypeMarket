class AddAuctionIdToBid < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :auction_id, :integer
  end
end
