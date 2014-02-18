class AdminRegCommunsController < ApplicationController
  
  layout 'admin_users'
  
  #before_filter :confirm_logged_in  
  
  def list

    @admin_reg_communs = RegCommun.paginate(page: params[:page]).per_page(50)
    #@products = Product.order("name").page(params[:page]).per_page(10)



    # gon.contacts = Contact.all
    # gon.count = Contact.count

    # @test = "test msg"
     
    # @contacts = Contact.all
    
    
  end
  
  def new
  end
  
  def view
    # @contact = Contact.find(params[:id])
    
    
    #render :template => 'view.js.erb'
    
    # @review = Review.create!(params[:review])
    # flash[:notice] = "Thank you for reviewing this product"
    
    # respond_to do |format|
      # format.html
      # format.js      
    # end
    
  end
    
  def show
    @reg_commun = RegCommun.find(params[:id])    
  end
  
  def create
  end
  
  def edit
    # render text: "in edit"
  end
  
  def update
  end

  def delete
    # @contact = Contact.find(params[:id])
  end

  def destroy
    
    reg_commun = RegCommun.find(params[:id])
    reg_commun.delete
    redirect_to(admin_communs_list_path)
    
    # contact = Contact.find(params[:id])
    # contact.delete
    # flash[:notice] = "Contact destroyed."
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
  
  def get_message
    
    # respond_to do |format|
      # format.html
      # format.js      
    # end    
  end
  
  
end
