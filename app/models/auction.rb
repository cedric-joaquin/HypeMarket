class Auction < ApplicationRecord
    belongs_to :user, foreign_key: :seller_id, class_name: "User"
    has_many :bids
    has_many :bidders, through: :bids
end
