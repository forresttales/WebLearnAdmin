class AdminUsersController < ApplicationController
  
  layout 'admin_users'
  
  helper_method :sort_column, :sort_direction


  before_action :signed_in_user
  before_action :signed_in_user_super_admin, except: :home
  
  
  # before_action :verify_user
                #only: [:index, :edit, :update, :destroy, :following, :followers]
  
  #before_filter :confirm_logged_in  
  
  # def verify_user
    # if signed_in?
    # else
      # redirect_to '/'
    # end
  # end
  
  
  def index

    @admin_users = AdminUser.order(sort_column + " " + sort_direction).paginate(page: params[:page]).per_page(100)
    
  end
  
  def home
    
    # @current_user_admin = current_user.admin
    
  end
  
  
  # def list
    # @admin_users = AdminUser.paginate(page: params[:page]).per_page(5)
  # end
  
  def new
    #@account_type = params[:id]
    @admin_user = AdminUser.new    
  end
  
  def view
    # @user = User.find(params[:id])
        
    # respond_to do |format|
      # format.html
      # format.js      
    # end
    
  end
    
  def show
    @admin_user = AdminUser.find(params[:id])    
    
    @admin_user_next = @admin_user.next
    @admin_user_previous = @admin_user.previous
    
  end
    
  
  def create
    
    # file_dir = 'public/repository/image_eric.jpg'    
    # AdminUser.photo_from_url(Rails.root.join(file_dir))     
    
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
        redirect_to action: "index"
    else
      render 'new'
    end
    
  end
  


  def edit
    @admin_user = AdminUser.find_by_id(params[:id])    
  end
  
  def update
    
    # Rails.logger.info("in update admin_users")
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(params[:admin_user])
      redirect_to(:action => 'show', :saved_id => @admin_user.id)
    else
      render text: 'update failed'
    end    
    
  end






  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    admin_user = AdminUser.find(params[:id])
    admin_user.delete
    #flash[:notice] = "User destroyed."
  end
  
  def dbdelete
      AdminUser.dbdelete
      redirect_to action: "index"
      # render text: 'dbdelete'
  end
  
  def dbclear
      AdminUser.dbclear
      redirect_to action: "index"
      # render text: 'dbclear'
  end
  
  
  # def confirm_logged_in
    # unless session[:user_id]
      # redirect_to(login_path)
      # return false 
    # else
      # return true
    # end
  # end
# 
  # def logout
    # session[:user_id] = nil
    # session[:username] = nil
    # #flash[:notice] = "You have been logged out."
    # #redirect_to("login_path")
# 
    # redirect_to(:controller => 'admin_users', :action => 'home')
#     
#     
    # #render text: "in logout"
  # end
  
  
  private

    def admin_user_params
      params.require(:admin_user).permit(      
                                          :name_first, 
                                          :name_last, 
                                          :email, 
                                          :username, 
                                          :password, 
                                          :password_confirmation,
                                          :admin,
                                          :super_admin
                                        )
                                        
    end
    
    def sort_column
      AdminUser.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
    
  # def get_message
#     
    # respond_to do |format|
      # format.html
      # format.js      
    # end    
  # end
  
end
