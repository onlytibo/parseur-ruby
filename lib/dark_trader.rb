require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"


pageAllCryptos = Nokogiri::HTML(open(PAGE_URL))

# Extraire les "div" qui contiennent les symboles des cryptos
allCryptoSymbols = pageAllCryptos.xpath('//td[@class = "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]/div')
 
allCryptoSymbolsArray = []
allCryptoSymbols.map do |symbol|
  allCryptoSymbolsArray << symbol.text # On met tous les Symbols dans un Array
end

# Extraire les "a" qui contiennent les prix 
allCryptoPrices = pageAllCryptos.xpath('//td[@class = "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/a')
 
allCryptoPricesArray = []
allCryptoPrices.map do |price|
  price = price.text.delete!("$")
  price = price.to_f
  allCryptoPricesArray << price.to_f # On met tous les Prices dans un Array
end

# On merge les deux Array dans un Hash

symbolsAndPricesHash = [allCryptoSymbolsArray, allCryptoPricesArray].transpose.to_h

# On met tous les hashs dans un nouvel Array

def add_hashes_into_array(symbolsAndPricesHash) 
  array_of_symbols_and_prices = []

  array_of_symbols_and_prices << symbolsAndPricesHash.map {|k,v| {k => v}} # Split le Hash principal en plusieurs Hashes de type {k, v}, et on met chaque {k,v} dans un Array.

  print array_of_symbols_and_prices
end

add_hashes_into_array(symbolsAndPricesHash)