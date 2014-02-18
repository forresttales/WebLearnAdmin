class AdminLandingsController < ApplicationController

  layout 'admin_users'
  
  #before_filter :confirm_logged_in  
  
  def list

    @admin_landings = Landing.paginate(page: params[:page]).per_page(50)
    
  end
  
  def new
    @admin_landing = Landing.new
    
  end
  
  def view
    
  end
    
  def show

    @admin_landing = Landing.find(params[:id])
    
  end
  
  def create
    @admin_landing = Landing.new(admin_landing_params)
    if @admin_landing.save
      #flash[:success] = "Record saved"
      render 'index'
    else
      #flash.now[:notice] = "Record failed"
      render 'new'
    end
    
  end
  
  def edit
    @admin_landing = Landing.find_by_id(params[:id])    
    
  end
  
  def update
    @admin_landing = Landing.find(params[:id])
    
    if @admin_landing.update_attributes(params[:landing])
      # redirect_to(:action => 'show', :saved_id => @landing.id)
      
      redirect_to(:action => 'show', :saved_id => @admin_landing.id)
      
    else
      # @subject_count = Subject.count
      render text: 'update failed'
    end    
    
  end

  def delete
  end

  def destroy
    
    landing = Landing.find(params[:id])
    landing.delete
    redirect_to(admin_landings_list_path)
    
  end
  
  def confirm_logged_in
    # unless session[:user_id]
      # flash[:notice] = "Please log in."
      # redirect_to(login_path)
      # return false # halts the before_filter
    # else
      # #redirect_to(:controller => 'admin_users', :action => 'list')
      # return true
    # end
  end
  
  def destroy
    
    # landing = Landing.find(params[:id])
    # landing.delete
    # redirect_to(admin_landings_list_path)
    
  end

  
  private

    def landing_params
      params.require(:landing).permit(:id, :name, :company, :email)
    end
  
  
  
end
