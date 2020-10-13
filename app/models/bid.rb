class Bid < ApplicationRecord
    belongs_to :bidder, foreign_key: :bidder_id, class_name: "User"
    belongs_to :auction

    validates :bid, presence: true
    

    scope :bid_history, -> { (order("bid desc")) }
    scope :highest_bid, -> { bid_history.limit(1).first.bid }
    scope :highest_bidder, -> { bid_history.limit(1).first.bidder}
end
