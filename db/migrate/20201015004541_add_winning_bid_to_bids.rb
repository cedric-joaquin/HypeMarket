class AddWinningBidToBids < ActiveRecord::Migration[6.0]
  def change
    add_column :bids, :winning_bid, :boolean
  end
end
