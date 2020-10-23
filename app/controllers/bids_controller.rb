class BidsController < ApplicationController
    before_action :require_login
    
    def create
        @bid = Bid.new(bid: params[:bid][:bid], bidder: current_user, auction: Auction.find_by(id: params[:bid][:auction][:id]))
        if @bid.valid?
            @bid.save
            redirect_to auction_path(@bid.auction)
        else
            @auction = Auction.find_by(id:params[:bid][:auction][:id])
            render "auctions/show"
        end
    end

    def update
        bid = Bid.find_by(id: params[:id])
        bid.update(bid: params[:bid][:bid])
        redirect_to auction_path(bid.auction)
    end
    
    def destroy
        bid = Bid.find_by(id: params[:id])
        auction = bid.auction
        bid.destroy if current_user.bids.find_by(id: bid.id)
        redirect_to auction_path(auction)
    end
end
