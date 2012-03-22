class PagesController < ApplicationController
  def home
    @title = "Home"
    @countries = Country.all
    @vacations = Vacation.all[0..2]
    
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def new_serach
    @title = "Search Again"
  end
  
  
  
  
end
