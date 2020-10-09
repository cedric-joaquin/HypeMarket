class AddBidderReferenceToBids < ActiveRecord::Migration[6.0]
  def change
    #Creates a bidder_id column with foreign_key reference to users
    add_reference :bids, :bidder, null: false, foreign_key: {to_table: :users}
  end
end
