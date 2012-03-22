class ApplicationController < ActionController::Base
  protect_from_forgery


  private
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  private 
   def stored_location_for(resource_or_scope)
     nil
   end

   def after_sign_in_path_for(resource_or_scope)
     user_path(current_user)
   end
  
  

  
end
