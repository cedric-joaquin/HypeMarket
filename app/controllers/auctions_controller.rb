class AuctionsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]

    def index
        @auctions = Auction.all
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
    end

    def create
        auction = Auction.create(item: params[:auction][:item], seller:current_user)
        redirect_to auction
    end

end
