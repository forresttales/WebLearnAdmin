class AdminRegLettersController < ApplicationController

  layout 'admin_users'
  
  #before_filter :confirm_logged_in  
  
  def list

    @admin_reg_letters = RegLetter.paginate(page: params[:page]).per_page(50)
    #@products = Product.order("name").page(params[:page]).per_page(10)



    # gon.contacts = Contact.all
    # gon.count = Contact.count

    # @test = "test msg"
     
    # @contacts = Contact.all
    
    
  end
  
  def new
  end
  
  def view
    # @reg_letter = RegLetter.find(params[:id])
    
    #render :template => 'view.js.erb'
    
    # @review = Review.create!(params[:review])
    # flash[:notice] = "Thank you for reviewing this product"
    
    # respond_to do |format|
      # format.html
      # format.js      
    # end
    
  end
    
  def show
    @reg_letter = RegLetter.find(params[:id])
    
    # @reg_letter = RegLetter.find(1)
    
  end
  
  def create
  end
  
  def edit
    # render text: "in edit"
  end
  
  def update
  end

  def delete
    
    # render text: 'delete'
    
    # @reg_letter = RegLetter.find(params[:id])

    # RegLetter.find(params[:id]).destroy
    # redirect_to :action => 'list'    
  end

  def destroy
    
    # render text: 'destroy'
    
    reg_letter = RegLetter.find(params[:id])
    reg_letter.delete
    redirect_to(admin_letters_list_path)
    
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
