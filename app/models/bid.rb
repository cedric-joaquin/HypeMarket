class Bid < ApplicationRecord
    belongs_to :bidder, foreign_key: :bidder_id, class_name: "User"
    belongs_to :auction
end
