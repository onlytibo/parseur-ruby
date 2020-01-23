require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"


page_all_cryptos = Nokogiri::HTML(open(PAGE_URL))

datas_rows = page_all_cryptos.xpath('//tr[contains(@class,"cmc-table-row")]')

array_of_hashes = []
datas_rows.map do |row| 
  symbol = row.xpath('//td[contains(@class,"symbol")]/div')
  price = row.xpath('//td[contains(@class,"price")]')
  array_of_hashes << { symbol.text => price.text }
end

puts datas_rows[1]
# puts array_of_hashes

# .each do |symbol, price|
# hash[:symbol] = price