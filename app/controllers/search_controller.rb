# encoding: utf-8
class SearchController < ApplicationController

  def results
    if params[:city] == '0' || params[:country == '0']
       flash[:error] = "Please select a country"
       redirect_to root_url
    else
       city = params[:city]
       country = params[:country]
       date = params[:date]
       nights = params[:nights]
    end
    
    @url = "https://affiliate.xsapi.webresint.com/1.1/propertylocationsearch.json?consumer_key=rankandmile.com&consumer_signature=5a50436e660bee116ec0bbcff7ef018aa1637cab&Country=#{country}&City=#{city}&DateStart=#{date}&NumNights=#{nights}"
    @searchresults = HTTParty.get(@url)
    
    
    
  end
   
     
   
   
  
end
