# encoding: utf-8
class SearchController < ApplicationController
    
  before_filter :validate_results, :only => :results
    
  def validate_results
    if params[:city] == '0' || params[:country == '0']
       flash[:notice] = "Please select a country and city"
       redirect_to root_url
    elsif params[:nights].class != Integer || params[:nights] > 14 || params[:nights] < 1
       flash[:notice] = "Please select a valid number of nights (1-14)"
       redirect_to root_url
    end  

  end

  
    
  def results
    if params[:city] == '0' || params[:country == '0']
       flash[:notice] = "Please select a country and city"
       redirect_to root_url
    else
       @city = params[:city]
         @city.gsub!(" ", "+") if @city.include?(" ")
       @country = params[:country]
         @country.gsub!(" ", "+") if @country.include?(" ")
         @date = params[:date]
         @nights = params[:nights]
    
    
    @url = "https://affiliate.xsapi.webresint.com/1.1/propertylocationsearch.json?consumer_key=rankandmile.com&consumer_signature=5a50436e660bee116ec0bbcff7ef018aa1637cab&Country=#{@country}&City=#{@city}&DateStart=#{@date}&NumNights=#{@nights}"
    @searchresults = HTTParty.get(@url).parsed_response
    session[:user] = {"date" => params[:date], "nights" => params[:nights]}
  
    @paginatedresults = Kaminari.paginate_array(@searchresults['result']['Properties']).page(params[:page]).per(10)
    end
  end
  
  def show
    @hotelnumber = params[:id]
    @detailsurl = "https://affiliate.xsapi.webresint.com/1.1/propertyinformation.json?consumer_key=rankandmile.com&consumer_signature=5a50436e660bee116ec0bbcff7ef018aa1637cab&PropertyNumber=#{@hotelnumber}"
    @hoteldetails = HTTParty.get(@detailsurl)
    @date = session[:user]['date']
    @nights = session[:user]['nights']
    session[:user]['name'] = @hoteldetails['result']['propertyName']
    session[:user]['image1'] = @hoteldetails['result']['propertyImages'][0]['imageURL']
    session[:user]['image2'] = @hoteldetails['result']['propertyImages'][1]['imageURL']

 
  end
     
  def booking

    @hotelnumber = params[:id]
    @date = session[:user]['date']
    @nights = session[:user]['nights']
    @bookingurl = "https://affiliate.xsapi.webresint.com/1.1/propertybookinginformation.json?TestMode=1&consumer_key=rankandmile.com&consumer_signature=5a50436e660bee116ec0bbcff7ef018aa1637cab&&Currency=USD&PropertyNumber=#{@hotelnumber}&Language=English&DateStart=#{@date}&NumNights=#{@nights}"
    @bookingdetails = HTTParty.get(@bookingurl)
    # Re-assign nights based on how many nights are available (i.e if you picked 3 and only 2 are available, it will auto-adjust)
    @newnights = @bookingdetails['result']['availableDates'].length if @bookingdetails
    session[:user]['nights'] = @newnights if @bookingdetails
    @hotelname = session[:user]['name']
    @image1 = session[:user]['image1']
    @image2 = session[:user]['image2']
    @roomcode = session[:user]['roomcode']
    if @bookingdetails.blank?
      flash[:error] = "Your session has expired, please search again"
      redirect_to root_url
    end
  end
  
  
  def payment
    @hotelname = session[:user]['name']
    @guests = params[:guests]
    @roomcode = params[:roomcode]
    @date = session[:user]['date']
    @nights = session[:user]['nights']
    @hotelnumber = params[:id]
    @paymenturl =  "https://affiliate.xsapi.webresint.com/1.1/propertybookingrequest.json?TestMode=1&consumer_key=rankandmile.com&consumer_signature=5a50436e660bee116ec0bbcff7ef018aa1637cab&&Currency=USD&PropertyNumber=#{@hotelnumber}&Language=English&DateStart=#{@date}&NumNights=#{@nights}&RoomPreference1=#{@roomcode}&Persons1=#{@guests}"
    @paymentinfo = HTTParty.get(@paymenturl)
    
    # Need to store BSID returned from booking request for future use
  end
  
  def confirmation
    @confirmed = HTTParty.post("example URL with parameters")
  end
  
  
   
  
end
