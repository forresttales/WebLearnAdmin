class AdminUserProfilesController < ApplicationController

  layout 'admin_user_profile'
    
  #before_filter :confirm_logged_in  
  
  def index

    @admin_user_profile = AdminUserProfile.find(session[:admin_user_id])    
    
    admin_user_image = AdminUserImage.where("admin_user_images.admin_user_id = ? AND admin_user_images.primary = ?", session[:admin_user_id], true)       

    image_name = admin_user_image[0].image_name
    
    gon.image_name = image_name
    
  end

    
  def show
    @admin_user_profile = AdminUserProfile.find(session[:admin_user_id])    
  end
    
  
  def create
    
    # file_dir = 'public/repository/image_eric.jpg'    
    # AdminUser.photo_from_url(Rails.root.join(file_dir))     
    
    @admin_user_profile = AdminUser.new(admin_user_profile_params)
    if @admin_user_profile.save
        
        redirect_to action: "index"
        
        
    else
      render 'new'
    end
    
  end

  
  def edit
    @admin_user_profile = AdminUser.find_by_id(params[:id])    
  end

  
  def update
    
    @admin_user_profile = AdminUser.find(params[:id])
    
    if @admin_user_profile.update_attributes(params[:admin_user_profile])
      
      redirect_to(:action => 'show', :saved_id => @admin_user_profile.id)
      
    else
      
      render text: 'update failed'
      
    end    
    
  end


  
  private

    def admin_user_profile_params
      params.require(:admin_user_profile).permit(      
                                          :name_first, 
                                          :name_last, 
                                          :email, 
                                          :username, 
                                          :password, 
                                          :password_confirmation, 
                                          :created_at, 
                                          :updated_at,
                                        )
                                        
    end
    
    def sort_column
      AdminUser.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
    
  
end


