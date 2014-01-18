require 'nokogiri'
require 'open-uri'

module AirportScraper
  def self.get_airports
    url = "http://en.wikipedia.org/wiki/List_of_airports_in_the_United_States"
    page = Nokogiri::HTML(open(url))
    state =  nil
    page.css(".wikitable tr").each do |row|
      if !row.css("cite").blank?
        state = row.css("cite")[0]['id'].to_s
        puts "New state: #{state}"
      elsif row['valign'] == 'top'
        ap = Airport.new
        ap.state = state
        ap.name = row.css("td")[4].text.to_s
        ap.city = row.css("td")[0].text.to_s
        ap.abbreviation = row.css("td")[2].text.to_s
        ap.save!
        puts "New airports: #{ap.name}"
      end
    end
  end
end
