# encoding: utf-8
class Instantapi < ActiveResource::Base
  #include HTTParty
  self.site = "http://www.instantworldbooking.com/xml/xml_affiliates_properties.php"  
end