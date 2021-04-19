class CoinController < ApplicationController
  before_action :set_api_service;

  def index
    @coins = Coin.all
    @tot_coin_up = Coin.tot_coin_up.size
    @tot_coin_down = Coin.tot_coin_down.size

    if params[:and_to_update] == 'true' && @coins.size <= 0
      @coins = @api_service.last_updated_coins['data'].each do |coin|
        Coin.new(
          name: coin['name'], 
          symbol: coin['symbol'], 
          slug: coin['slug'], 
          cmc_rank: coin['cmc_rank'], 
          price: coin['quote']['USD']['price'], 
          market_cap: coin['quote']['USD']['market_cap'],
          volume_24h: coin['quote']['USD']['volume_24h']
        ).save()
      end
    elsif params[:and_to_update] == 'true' && @coins.size >= 0
      @api_service.last_updated_coins['data'].each do |coin|
        price_first = Coin.where(name: coin['name']).first
        price_last = coin['quote']['USD']['price']

        Coin.where(name: coin['name']).update(
                   price: coin['quote']['USD']['price'], 
                   market_cap: coin['quote']['USD']['market_cap'],
                   volume_24h: coin['quote']['USD']['volume_24h'],
                   status_price: price_last > price_first.price
                )
      end
    end
  end

  def slug
    slug = params["slug"]
    @coin = Coin.find_by_slug(slug)

    if @coin
      render json: { coins: @coin }
    else
      flash[:error] = "ERROR! Moeda não encontrada"
      redirect_to root_path
    end
  end

  private

  def set_api_service
    @api_service = APIService.new
  end
  
end