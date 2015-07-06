class AdminRegLettersController < ApplicationController

  layout 'admin_users'

  before_action :signed_in_user  
  before_action :signed_in_user_admin, only: :edit

  helper_method :sort_column, :sort_direction


  def index

    @admin_reg_letters = RegLetter.order(sort_column + " " + sort_direction).paginate(page: params[:page]).per_page(10000)
    @@admin_reg_letters = @admin_reg_letters
    
  end


  def list

    @admin_reg_letters = RegLetter.paginate(page: params[:page]).per_page(50)
    #@products = Product.order("name").page(params[:page]).per_page(10)
    # gon.contacts = Contact.all
    # gon.count = Contact.count
    # @test = "test msg"
    # @contacts = Contact.all
    
  end
  


  def dbdelete
      RegLetter.dbdelete
      redirect_to action: "index"
      # render text: 'dbdelete'
  end
  
  
  def dbclear
      RegLetter.dbclear
      redirect_to action: "index"
      # render text: 'dbclear'
  end
  
  
  def export
    
    @admin_reg_letters = @@admin_reg_letters
  
    respond_to do |format|
      format.html
      format.csv
       #format.js
    end
    
  end
  
  
  def list
    # gon.contacts = Contact.all
  end
  
  def new
  end
  
  def view
  end
    
  def show
    @admin_reg_letter = RegLetter.find(params[:id])    
    @admin_reg_letter_next = @admin_reg_letter.next
    @admin_reg_letter_previous = @admin_reg_letter.previous

  end

  
  def create
  end

  
  def edit
    @admin_reg_letter = RegLetter.find_by_id(params[:id])    
  end

  
  def update
    
    @admin_reg_letter = RegLetter.find(params[:id])
    
    if @admin_reg_letter.update_attributes(params[:admin_reg_letter])
      redirect_to(:action => 'show', :saved_id => @admin_reg_letter.id)
    else
      render text: 'update failed'
    end    
  end


  def delete
    # @contact = Contact.find(params[:id])
  end

  def destroy
    
    admin_reg_letter = RegLetter.find(params[:id])
    if admin_reg_letter.delete
      redirect_to(admin_reg_letters_index_path)
    else
      render text: 'delete failed'
    end
    
  end
  

  
  private

    def admin_reg_letter_params
      params.require(:admin_reg_letter).permit(
                                              :name_title, 
                                              :name_affiliation, 
                                              :email 
                                              )
          
    end

  
    def sort_column
      RegLetter.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
end
