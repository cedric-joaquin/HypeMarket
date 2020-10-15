class Bid < ApplicationRecord
    belongs_to :bidder, foreign_key: :bidder_id, class_name: "User"
    belongs_to :auction

    validates :bid, presence: true

    scope :bid_history, -> { (order("bid desc")) }
    scope :highest_bid, -> { bid_history.limit(1).first }
    scope :highest_bidder, -> { highest_bid.bidder }
    scope :winning_bids, -> { where(winning_bid:true) }
    scope :winning_bidder, -> { where(winning_bid:true).bidder }
    scope :most_bids, -> { find_by_sql("SELECT *
        FROM bids
        GROUP BY auction_id
        HAVING COUNT (auction_id)=(
            SELECT MAX(bidCount)
            FROM (  SELECT auction_id, COUNT(auction_id) bidCount
                    FROM bids
                    GROUP BY auction_id));")}

end
