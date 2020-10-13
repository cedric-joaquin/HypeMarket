class Auction < ApplicationRecord
    belongs_to :seller, foreign_key: :seller_id, class_name: "User"
    has_many :bids
    has_many :bidders, through: :bids

    scope :hottest_auction, -> { count("bid desc").limit(1) }
    #Auction.joins(:bids).group(auction.id)
    # SELECT * FROM auctions INNER JOIN bids ON bids.auction_id = auctions.id
end
