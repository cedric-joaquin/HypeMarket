class AddSellerReferenceToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_reference :auctions, :seller, null: false, foreign_key: { to_table: :users}
  end
end
