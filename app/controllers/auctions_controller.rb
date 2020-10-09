class AuctionsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]

    def index
        @auctions = Auction.all
    end

    def show
        @auction = Auction.find_by(id: params[:id])
    end

    def new
    end

    def create

    end
end
