class SessionsController < ApplicationController

  layout 'session'

  def new
  end

  def create
    #user = User.find_by(email: params[:session][:email].downcase)
    admin_user = AdminUser.find_by(username: params[:session][:username])
    
    # user.nil?
    
    if admin_user && admin_user.authenticate(params[:session][:password])
      sign_in admin_user

      #session[:username] = user.username
      
      # redirect_back_or '/'
       
      redirect_to root_path
      
    else
      #flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
    
  end

  def destroy
    sign_out
    #redirect_to root_url
    redirect_to index_path    
  end
  
  
end
