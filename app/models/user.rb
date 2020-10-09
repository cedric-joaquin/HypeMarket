class User < ApplicationRecord
    has_many :auctions, foreign_key: :seller_id, class_name: "Auction"
    has_many :bids, foreign_key: :bidder_id, class_name: "Bid"

    #looks for association :auction in the Bid model to determine auctions
    #this user bid on
    has_many :bidded_auctions, through: :bids, source: :auction
end
