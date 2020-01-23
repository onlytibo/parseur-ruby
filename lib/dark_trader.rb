require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"



pageAllCryptos = Nokogiri::HTML(open(PAGE_URL))




def puts_symbols_in_array(pageAllCryptos)
  # Extraire les "div" qui contiennent les symboles des cryptos

  allCryptoSymbols = pageAllCryptos.xpath('//td[@class = "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]/div')

  allCryptoSymbolsArray = []

  allCryptoSymbols.map do |symbol|
    allCryptoSymbolsArray << symbol.text # On met tous les Symbols dans un Array
  end

  return allCryptoSymbolsArray
end

def puts_prices_in_array(pageAllCryptos)
  # Extraire les "a" qui contiennent les prix 

  allCryptoPrices = pageAllCryptos.xpath('//td[@class = "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/a')
  
  allCryptoPricesArray = []

  allCryptoPrices.map do |price|
    allCryptoPricesArray << price.text.delete_prefix!("$").delete(",").to_f # On met tous les Prices dans un Array
  end

  return allCryptoPricesArray
end

def merge_arrays_into_single_hash(allCryptoPricesArray,allCryptoSymbolsArray)
  # On merge les deux Array dans un Hash

  symbolsAndPricesHash = [allCryptoSymbolsArray, allCryptoPricesArray].transpose.to_h
  return symbolsAndPricesHash
end

# On met tous les hashs dans un nouvel Array
def add_hashes_into_array(symbolsAndPricesHash) 

  array_of_symbols_and_prices = []

  array_of_symbols_and_prices << symbolsAndPricesHash.map {|k,v| {k => v}} # Split le Hash principal en plusieurs Hashes de type {k, v}, et on met chaque {k,v} dans un Array.
  print array_of_symbols_and_prices

end



allCryptoSymbolsArray = puts_symbols_in_array(pageAllCryptos)
allCryptoPricesArray = puts_prices_in_array(pageAllCryptos)  
symbolsAndPricesHash = merge_arrays_into_single_hash(allCryptoPricesArray,allCryptoSymbolsArray)

add_hashes_into_array(symbolsAndPricesHash)
