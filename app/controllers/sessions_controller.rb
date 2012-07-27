class SessionsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :except => :destroy
  
  def new
    
  end
  
  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path, :alert => "You are logged in..."      
    else
      redirect_to new_session_path, :alert => "Not logged in..."
    end
      
  end
  
  def destroy
    reset_session    
    redirect_to new_session_path
  end
  
end
