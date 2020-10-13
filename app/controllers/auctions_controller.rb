class AuctionsController < ApplicationController
    before_action :require_login, only: [:new, :edit, :destroy, :create]

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
        @auction = Auction.find_by(id: params[:id])
    end

    def edit
        if params[:user_id]
            redirect_to user_auctions_path if !current_user.auctions.find_by(id: params[:id])
        else
            redirect_to auctions_path if !current_user.auctions.find_by(id: params[:id])
        end
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
        auction = Auction.create(item: params[:auction][:item], seller:current_user)
        redirect_to auction
    end

end
