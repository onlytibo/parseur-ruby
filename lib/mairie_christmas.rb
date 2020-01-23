require 'rubygems'
require 'nokogiri'
require 'open-uri'



# def get_townhall_urls(all_cities)
#   cities_url = []
#   list_cities = all_cities.xpath('//a[contains(@href,"./95/")]')
#   list_cities.map do |city_url|
#       townhall_url = "http://annuaire-des-mairies.com/" + "#{city_url['href'].delete_prefix!("./")}" # url de la ville
#       cities_url << townhall_url
#   end
#   return cities_url
# end
all_cities = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))


def get_townhall_urls(all_cities)
  full_cities_mail = []
  list_cities = all_cities.xpath('//a[contains(@href,"./95/")]')
  list_cities.map do |city_name_and_url|
      townhall_url = "http://annuaire-des-mairies.com/" + "#{city_name_and_url['href'].delete_prefix!("./")}" # url de la ville
      
      townhall_name = city_name_and_url.text
      
      get_townhall_email(townhall_url, full_cities_mail, townhall_name)
      

  end
    puts full_cities_mail

end


def get_townhall_email(townhall_url, full_cities_mail, townhall_name)
# récupère l’e-mail d'une mairie à partir de l'URL de mairie
  townhall_page = Nokogiri::HTML(open(townhall_url)) 
  townhall_email = townhall_page.at('td:contains("@")').text.strip 
  full_cities_mail << {townhall_name => townhall_email}
rescue
  puts "#{townhall_name} n'a pas d'e-mail"
end

get_townhall_urls(all_cities)