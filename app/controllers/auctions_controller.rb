class AuctionsController < ApplicationController
    before_action :require_login, only: [:new, :edit, :destroy, :create]

    def index
        if params[:user_id]
            @auctions = User.find_by(id: params[:user_id]).auctions
        else
            @auctions = Auction.all
        end
    end

    def new
        @auction = Auction.new
    end

    def show
        @auction = Auction.find_by(id: params[:id])
    end

    def edit
        redirect_to auctions_path if !current_user.auctions.find_by(id: params[:id])
        @auction = Auction.find_by(id: params[:id])
    end

    def destroy
        redirect_to auctions_path if !current_user.auctions.find_by(id: params[:id])
        Auction.find_by(id: params[:id]).destroy
        #change this to users/:id/auctions once you set up nested routes
        redirect_to auctions_path
    end

    def create
        auction = Auction.create(item: params[:auction][:item], seller:current_user)
        redirect_to auction
    end

end
