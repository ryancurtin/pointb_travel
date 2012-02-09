class PagesController < ApplicationController
  def home
    @title = "Home"
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
