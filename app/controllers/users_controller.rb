class UsersController < ApplicationController
  
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