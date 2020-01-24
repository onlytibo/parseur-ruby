require_relative '../lib/dark_trader.rb'


describe "test arrays's sizes" do

	it "test symbols array size" do
		expect(puts_symbols_in_array("Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))").length).to eq(200)
	end
		
	it "test symbols array size" do
		expect(puts_prices_in_array("Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))").size).to eq(200)
	end

end