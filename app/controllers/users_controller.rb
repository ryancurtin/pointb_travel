class UsersController < ApplicationController
  
  http_basic_authenticate_with :name => "admininstacasa", :password => "instacasa##5471", :only => [:index, :destroy, :edit]  
  
  def index
    @users = User.all
  end


  def show
    @user = User.find_by_id(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  

end