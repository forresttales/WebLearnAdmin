class PasswordResetsController < ApplicationController

  layout 'password_reset'
  
  # before_filter :force_http
  
  respond_to :html, :js, :json  

  
  def new
  end


  def create
    # user = User.find_by_email(params[:email])
    # user.send_password_reset if user
    # redirect_to root_url, :notice => "Email sent with password reset instructions."
  end


  def create_reset
    # o7g_VLgYLLScQQaKAO4Ysw  2014-09-17 05:10:24.501859
    ar = params[:admin_user]
    h_obj = Hash.new
    ar.each do |obj|
      h_obj = obj
    end
    email = h_obj[:email]
    
    admin_user = AdminUser.find_by_email(email)
    confirm_msg_1_b = false
    confirm_msg_2_b = false
    confirm_msg_3_b = false
    
    if admin_user
      if admin_user.send_password_reset
        # success
        confirm_msg_1_b = true
      else
        # * Send password reset instructions failed
        confirm_msg_2_b = true
      end
    else
      # * No record for this email address
      confirm_msg_3_b = true
    end 
        
    # user.send_password_reset if user
    
    respond_to do |format|
      format.html {}
      format.json { render :json => { :email => email,
                                      :confirm_msg_1_b => confirm_msg_1_b,
                                      :confirm_msg_2_b => confirm_msg_2_b,
                                      :confirm_msg_3_b => confirm_msg_3_b } }
    end
    
  end

  
  def edit
    @admin_user = AdminUser.find_by_password_reset_token!(params[:id])
  end

  
  def update
    
    @admin_user = AdminUser.find_by_password_reset_token!(params[:id])
    if @admin_user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @admin_user.update_attributes(params[:admin_user])
      redirect_to root_url, :notice => "* Password has been reset *"
    else
      render :edit
    end

  end


end
