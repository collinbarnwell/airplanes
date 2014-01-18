require 'airport_scraper'
require 'kayak_scraper'

namespace :scrape do
  task airports: :environment do
    AirportScraper.get_airports
  end

end