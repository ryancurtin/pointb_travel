class CitiesController < ApplicationController
  def index
     country = Country.find_by_name(params[:country])
     if country.blank?
       @data = {"error" => "Country is a required param"}
     else
       cities = City.find_all_by_country_id(country.id)
       @data = cities.collect {|city| {'name'=> city.name} }
     end
     render :json => @data, :layout => false
  end
  
  
end