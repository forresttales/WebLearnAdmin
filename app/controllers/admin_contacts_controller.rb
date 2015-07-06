class AdminContactsController < ApplicationController
  
  layout 'admin_users'
  
  helper_method :sort_column, :sort_direction
  
  #before_filter :confirm_logged_in  
  
  def index

    @admin_contacts = Contact.order(sort_column + " " + sort_direction).paginate(:per_page => 1000, :page => params[:page])

    #@admin_contacts = Contact.paginate(page: params[:page]).per_page(5)
    #@products = Product.order("name").page(params[:page]).per_page(10)



    # gon.contacts = Contact.all
    # gon.count = Contact.count

    # @test = "test msg"
     
    # @contacts = Contact.all
    
    
  end

  
  def new
  end
  
    
  def show
    
    @admin_contact = Contact.find(params[:id])
    
  end

  
  def create
  end

  
  def edit
  end

  
  def update
  end


  def delete
    @contact = Contact.find(params[:id])
  end


  def destroy
    contact = Contact.find(params[:id])
    contact.delete
    
    redirect_to :action => 'index'
    # flash[:notice] = "Contact destroyed."
  end
  
  
  
  private

    def admin_contact_params
      params.require(:admin_contact).permit(
                                            :name, 
                                            :email, 
                                            :subject, 
                                            :message 
                                            )
          
    end
  
  
    def sort_column
      Contact.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
  
  
end
