class SearchController < ApplicationController
  def coins
    @coins = Coin.search(params[:coin])
  end
end
