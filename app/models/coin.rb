class Coin < ApplicationRecord
  default_scope { order(cmc_rank: :asc) }

  scope :tot_coin_up, -> {
    where(status_price: true)
  }

  scope :tot_coin_down, -> {
    where.not(status_price: true)
  }

  def self.search(coin)
    if coin.blank?
      all
    else
      where('lower(name) LIKE :q OR lower(slug) LIKE :q OR lower(symbol) LIKE :q ', q: "%#{coin.downcase}%")
    end
  end
end
