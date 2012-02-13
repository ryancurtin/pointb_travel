class SearchController < ApplicationController
    
  def results
    if params[:location].include? ","
      location = params[:location].split(',')
      location[1] = location[1].strip
      city, country = location[0], location[1]
      @response = Hotel.where(:country => country, :city=> city)
      #@response = HTTParty.get("http://www.instantworldbooking.com/xml/files/#{@country}.xml")
      
      # Parse into an XML request and post


      postresults = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.iwbaffiliates {
        xml.apiversion "4.2"
        xml.apifunction "getpropertydetails"
        xml.authorization {
          xml.affiliate_id "pointb.com"
          xml.password "bSwOx665v!@rx%F7"
        }
        xml.properties('language' => 'en') {
          @response.each do |prop|
          xml.property {
            xml.subcontinent prop[:country]
            xml.city prop[:city]
            xml.dest prop[:name]
          }
        end
        }
      }
      end
      # curl task to post the results and get property details

      xmlresults = postresults.to_xml


#      uri = URI.parse(URI.encode(url.strip))


      conn = ActiveResource::Connection.new Instantapi.site.to_s

      @finalresult = conn.post Instantapi.site.to_s, xmlresults

      
      
      
          
    else
      @response = nil
      @finalresult = nil
      
    end


   
   
  end
end
