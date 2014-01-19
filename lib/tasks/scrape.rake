require 'airport_scraper'
require 'kayak_scraper'

namespace :scrape do
  task airports: :environment do
    AirportScraper.get_airports
  end

  # wheneverize this
  task prices: :environment do
    Order.where(active: true).find_each(batch_size: 100) do |order|
      price, provider = KayakScraper.get_price_provider(order)
      if price.nil?
        OrderMailer.no_flights(order)
        order.update_attributes(active: false)
      else
        if order.should_buy_now?(price)
          OrderMailer.buy_now(order, price, provider)
          order.update_attributes(active: false)
        end
      end
    end
  end
end