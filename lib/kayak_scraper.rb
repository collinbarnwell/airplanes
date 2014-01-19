require 'nokogiri'
require 'open-uri'

module KayakScraper
  def self.get_price_provider(order)
    host = "http://www.kayak.com/flights/"
    start_date = order.departure_time_start.strftime("%Y-%m-%d")
    end_date = order.return_time_start.strftime("%Y-%m-%d")
    url = "#{host}#{order.start_location}-#{order.end_location}/#{start_date}/#{end_date}"
    page = Nokogiri::HTML(open(url))
    price = page.css('.results_price.bookitprice')[0].text.to_f
    provider = page.css('.maindatacell.rsAirlineName.fairlinecol')[0].text.to_s
    [price, provider]
  end
end
