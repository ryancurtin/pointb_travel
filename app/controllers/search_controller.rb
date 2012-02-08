class SearchController < ApplicationController
  def results
    location = params[:location].split(',')
    
    city, country = location[0], location[1]
   
   
   
  end
end
