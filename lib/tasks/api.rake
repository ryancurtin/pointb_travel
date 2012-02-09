"desc"
task
  # make an array of all countries that the api supports -- STILL NEED TO FIGURE OUT HOW TO GET THIS FROM API
  response = HTTParty.get("http://www.instantworldbooking.com/xml/files/locations.xml")
  country = response['locations']['continent']['subcontinent']
  countryarr = []
  country.each do |i|
    countryarr << i['name']
  end
  # loop over this array and request the country xml
  countryarr.each do |country|
    response = HTTParty.get("http://www.instantworldbooking.com/xml/files/#{country}.xml")
    
    response.each do |newproperty|
      hotel = Hotel.new
      hotel.city << newproperty['properties']['property']['city']
      hotel.name << newproperty['properties']['property']['dest']
      hotel.country << newproperty['properties']['property']['subcontinent']
      hotel.save
    end
  end
  # loop over results using the 'count.times' method we created today
  # parse those results into the database (save it using active record objects)
end