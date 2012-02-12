require 'nokogiri'

postresults = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
xml.iwbaffiliates {
  xml.apiversion "4.2"
  xml.apifunction "getpropertydetails"
  xml.authorization {
    xml.affiliate_id "pointb.com"
    xml.pasword "bSwOx665v!@rx%F7"
  }
  xml.properties('language' => 'en') {
    @response.each do |prop|
    xml.property {
      xml.subcontinent prop[:country]
      xml.city prop[:city]
      xml.dest prop[:name]
    }
  }
}
end
# curl task to post the results and get property details

xmlresults = postresults.to_xml

conn = ActiveResource::Connection.new 'http://www.instantworldbooking.com/xml/xml_affiliate_properties.php'

finalresult = conn.post 'xml_affiliate_properties.php', xmlresults
