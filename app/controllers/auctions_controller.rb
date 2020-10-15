class AuctionsController < ApplicationController
    before_action :require_login, only: [:new, :destroy, :create]

    def index
        if params[:user_id]
            redirect_to user_path(current_user) if params[:user_id].to_i != current_user.id
            @auctions = User.find_by(id: params[:user_id]).auctions
        else
            @auctions = Auction.all
        end
    end

    def new
        @auction = Auction.new
    end

    def show
        @bid = Bid.new
        @auction = Auction.find_by(id: params[:id])
    end

    def destroy
        if params[:user_id]
            redirect_to user_auctions_path if !current_user.auctions.find_by(id: params[:id])
            Auction.find_by(id: params[:id]).destroy
            redirect_to user_auctions_path
        else
            redirect_to auctions_path if !current_user.auctions.find_by(id: params[:id])
            Auction.find_by(id: params[:id]).destroy
            redirect_to auctions_path
        end
        #change this to users/:id/auctions once you set up nested routes
    end

    def create
        @auction = Auction.new(item: params[:auction][:item], seller:current_user)
        if @auction.valid?
            @auction.save
            redirect_to auction
        else
            render :new
        end
    end

    def sold
        auction = Auction.find_by(id: params[:id])
        auction.update(sold: true)
        auction.bids.highest_bid.update(winning_bid: true)
        redirect_to auction_path(auction)
    end

end
