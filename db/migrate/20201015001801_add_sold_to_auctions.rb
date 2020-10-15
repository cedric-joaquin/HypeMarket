class AddSoldToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :sold, :boolean
  end
end
