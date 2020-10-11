class Bid < ApplicationRecord
    belongs_to :bidder, foreign_key: :bidder_id, class_name: "User"
    belongs_to :auction

    scope :bid_history, -> { (order("bid desc")) }
    scope :highest_bid, -> { bid_history.limit(1) }
end
