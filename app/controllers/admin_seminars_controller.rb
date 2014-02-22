class AdminSeminarsController < ApplicationController
  
  layout 'admin_users'
  
  helper_method :sort_column, :sort_direction
  
  #before_filter :confirm_logged_in  
  
  def index

    @admin_seminars = AdminSeminar.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])

    #@admin_seminars = AdminSeminar.paginate(page: params[:page]).per_page(5)
    #@products = Product.order("name").page(params[:page]).per_page(10)



    # gon.seminars = AdminSeminar.all
    # gon.count = AdminSeminar.count

    # @test = "test msg"
     
    # @seminars = AdminSeminar.all
    
    
  end

  
  def new
  end
  
    
  def show
    
    @admin_seminar = AdminSeminar.find(params[:id])
    
  end

  
  def create
  end

  
  def edit
  end

  
  def update
  end


  def delete
    # @seminar = AdminSeminar.find(params[:id])
  end


  def destroy
    # seminar = AdminSeminar.find(params[:id])
    # seminar.delete
    # flash[:notice] = "AdminSeminar destroyed."
  end
  
  
  
  private

    def admin_seminar_params
      params.require(:admin_seminar).permit(
                                            :name_first, 
                                            :name_last, 
                                            :name_title, 
                                            :type_affiliation, 
                                            :name_affiliation, 
                                            :address, 
                                            :city, 
                                            :state, 
                                            :zip, 
                                            :phone, 
                                            :email, 
                                            :email_cc_1, 
                                            :email_cc_2, 
                                            :seminar_1, 
                                            :seminar_1_text,
                                            :created_at,
                                            :updated_at
                                            )
          
    end
  
  
    def sort_column
      AdminSeminar.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
  
  
  
end
