require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"


pageAllCryptos = Nokogiri::HTML(open(PAGE_URL))

# allCryptoRows = pageAllCryptos.xpath('//tr[@class = "cmc-table-row"]')

# puts allCryptoRows[1].class


# allCryptoNames = allCryptoRows.xpath('//td[@class = "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]/div').class

# allCryptoPrices = allCryptoRows.xpath('//td[@class = "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/a').class

symbols_and_prices = pageAllCryptos.xpath('//tr[contains(@class,"cmc-table-row")]')
puts symbols_and_prices[1]

# .each do |symbol, price|
# hash[:symbol] = price