class BidsController < ApplicationController
    before_action :require_login
    
    def create
        bid = Bid.create(bid: params[:bid][:bid], bidder: current_user, auction: Auction.find_by(id: params[:bid][:auction][:id]))
        redirect_to auction_path(bid.auction)
    end

    def update
        bid = Bid.find_by(id: params[:id])
        bid.update(bid: params[:bid][:bid])
        redirect_to auction_path(bid.auction)
    end
    
    def destroy
    end
end
