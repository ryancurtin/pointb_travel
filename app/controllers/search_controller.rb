# encoding: utf-8
class SearchController < ApplicationController


    
  # def results
  #    if params[:location].include? ","
  #      location = params[:location].split(',')
  #      location[1] = location[1].strip
  #      city, country = location[0], location[1]
  #      @response = Hotel.where(:country => country, :city=> city)
  #      #@response = HTTParty.get("http://www.instantworldbooking.com/xml/files/#{@country}.xml")
  #      
  #      # Parse into an XML request and post
  # 
  # 
  #      postresults = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
  #      xml.iwbaffiliates {
  #        xml.apiversion "4.2"
  #        xml.apifunction "getpropertydetails"
  #        xml.authorization {
  #          xml.affiliate_id "pointb.com"
  #          xml.password "bSwOx665v!@rx%F7"
  #        }
  #        xml.properties('language' => 'en') {
  #          @response.each do |prop|
  #          xml.property {
  #            xml.subcontinent prop[:country]
  #            xml.city prop[:city]
  #            xml.dest prop[:name]
  #          }
  #        end
  #        }
  #      }
  #      end
  
  
  
        # 
        # MultiXml.parser = :nokogiri
        # response = (conn.post Instantapi.site.to_s, @xmlresults)
        # #raise response.body.force_encoding('utf-8').inspect
        # @finalresult = MultiXml.parse(response.body.force_encoding('utf-8'))
     #  
     # 
     #       
     # else
     #   @response = nil
     #   @finalresult = nil
     #   
     # end
 
  @conn = HTTParty.get("https://affiliate.xsapi.webresint/1.1/citycountrylist.json?consumer_key=rankandmile.com&consumer_signature=5a50436e660bee116ec0bbcff7ef018aa1637cab&Country=Albania")
  
   
   
  
end
