class SearchController < ApplicationController
  def results
    if params[:location].include? ","
      location = params[:location].split(',')
      location[1] = location[1].strip
      @city, @country = location[0], location[1]
      @response = HTTParty.get("http://www.instantworldbooking.com/xml/files/#{@country}.xml")    
    else
      @response = nil
      
    end


    # @count = @response['properties']['property'].size
   
   
  end
end
