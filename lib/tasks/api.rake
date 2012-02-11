require 'HTTParty'
require 'open-uri'

task :populatelocations do
  # make an array of all countries that the api supports -- STILL NEED TO FIGURE OUT HOW TO GET THIS FROM API
  locations = open("http://www.instantworldbooking.com/xml/files/locations.xml").read
  countries = locations.scan(/<subcontinent.+?name="(.+?)"./)
  countryarr = []
  countries.each do |i|
    countryarr << i.to_s.gsub!("\"", "").gsub!("[", "").gsub!("]", "")
  end
  
  countryarr.each do |i|
    i.gsub!(" ", "-")
  end
  
  
  # loop over this array and request the country xml

# API is inconsistent here --> There is a leading '[' in some location.xml files
# Need to write an if statement (i.e. if response['properties']['property'].class = Array vs. Hash ***WORKS NOW
# Need to loop over each property given a response
# Portugal is not working -> Contact Instant World Booking
# Florida is not working -> Contact Instant World Booking
# Virginia is not working -> Contact Instant World Booking



  countryarr.each do |country|
    response = HTTParty.get("http://www.instantworldbooking.com/xml/files/#{country}.xml").parsed_response
    if response['properties']['property'].class == Array
      i = 0
      while i < response['properties']['property'].length do
        hotel = Hotel.new
        hotel.city = response['properties']['property'][i]['city']
        hotel.name = response['properties']['property'][i]['dest']
        hotel.country = response['properties']['property'][i]['subcontinent']
        hotel.save
        i += 1
      end
    else
      hotel = Hotel.new
      hotel.city = response['properties']['property']['city']
      hotel.name = response['properties']['property']['dest']
      hotel.country = response['properties']['property']['subcontinent']
      hotel.save
    end
  end
  # loop over results using the 'count.times' method we created today
  # parse those results into the database (save it using active record objects)
end