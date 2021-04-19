class APIService 
  include HTTParty
  
  BASE_URI = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=300'

  def initialize
    @headers = {
      "Content-Type" => "application/json",
      ENV['API_KEY'] => ENV['API_VALUE'],
    }
  end

  def last_updated_coins
    self.class.get(BASE_URI, headers: @headers)
  end
end