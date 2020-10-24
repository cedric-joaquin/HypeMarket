class Bid < ApplicationRecord
    belongs_to :bidder, foreign_key: :bidder_id, class_name: "User"
    belongs_to :auction

    validates :bid, presence: true, on: :create

    scope :bid_history, -> { (order("bid desc")) }
    scope :highest_bid, -> { bid_history.limit(1).first }
    scope :highest_bidder, -> { highest_bid.bidder }
    scope :winning_bids, -> { where(winning_bid:true) }
    scope :winning_bidder, -> { where(winning_bid:true).bidder }

end
