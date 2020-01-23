require 'rubygems'
require 'nokogiri'
require 'open-uri'

url_valdoise = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))


def get_townhall_urls(url_valdoise)
  array_final = []
  cities = url_valdoise.xpath('//a[contains(@href, "./95")]')
  cities.map do |url_name|
    full_url = "https://www.annuaire-des-mairies.com/" + "#{url_name['href'].delete_prefix!("./")}"
    name = url_name.text

    get_townhall_mail(full_url, name, array_final)
  end
  puts array_final
end


def get_townhall_mail(full_url, name, array_final)
  general_townhall = Nokogiri::HTML(open(full_url))
  townhall_mail = general_townhall.at('td:contains("@")').text.strip
  array_final << {name => townhall_mail}
rescue
    puts "#{name} n'a pas d'e-mail"
end
puts get_townhall_urls(url_valdoise)