require 'nokogiri'
require 'open-uri'

module KayakScraper
  def self.get_price_provider(order)
    host = "http://www.kayak.com/flights/"
    start_date = order.departure_time_start.strftime("%Y-%m-%d")
    end_date = order.return_time_start.strftime("%Y-%m-%d")
    url = "#{host}#{order.start_location}-#{order.end_location}/#{start_date}/#{end_date}"
    page = Nokogiri::HTML(open(url))

    num = -1
    page.css('.maindatacell.rsAirlineName.fairlinecol').each_with_index do |row, index|
      unless order.bad_airlines.include? row.text.to_s
        num = index
        break
      end
    end
    return nil if num == -1

    price = page.css('.results_price.bookitprice')[num].text.to_f
    provider = page.css('.maindatacell.rsAirlineName.fairlinecol')[num].text.to_s
    [price, provider]
  end
end
