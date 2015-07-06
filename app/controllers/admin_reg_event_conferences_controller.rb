class AdminRegEventConferencesController < ApplicationController

  layout 'admin_users'
  
  before_action :signed_in_user  
  before_action :signed_in_user_admin, only: :edit
  
  helper_method :sort_column, :sort_direction
  
  
  @@admin_reg_event_conferences = nil
  @@delete = false
  @@s = ''
  
  def index

    # Rails.logger.info(@user.errors.messages.inspect)
    # Rails.logger.info('in index')
    
    
    s = 's'
    search_by = ''
    search = ''
    # workshop = ''    
    search_by_text = ''

    if params[:search_by].nil?
      @admin_reg_event_conferences = RegEventConference.order(sort_column + " " + sort_direction).paginate(:per_page => 2000, :page => params[:page])
    else
      search_by = params[:search_by].to_s
      search = params[:search].to_s
      # workshop = params[:workshop].to_s
      
      case search_by
      when "1"
        search_by_text = 'id'
      when "2"
        search_by_text = 'name_first'
      when "3"
        search_by_text = 'name_last'
      when "4"
        search_by_text = 'type_affiliation'
      when "5"
        search_by_text = 'name_affiliation'
      else
        #
      end
      
  
      # if (workshop == '16' and search.length == 0)
        # @admin_reg_event_conferences = RegEventConference.order(sort_column + " " + sort_direction).paginate(:per_page => 2000, :page => params[:page])
      # else
            # # if (workshop == '16' and search.length > 0)
                # # if search_by_text == 'id'
                  # # s = "id=" + search
                # # else
                  # # s = search_by_text + " LIKE '" + search + "'"
                # # end
            # # elsif (workshop != '16' and search.length == 0)
                # # s = "city_workshop_" + workshop + "=true"
            # # elsif (workshop != '16' and search.length > 0)
                # # s = search_by_text + " LIKE '" + search + "' AND city_workshop_" + workshop + "=true"
            # # else
                # # #
            # # end
            # # @admin_reg_event_conferences = RegEventConference.search_by_sql(s).order(sort_column + " " + sort_direction).paginate(:per_page => 2000, :page => params[:page])
      # end
      
    end
    
    @@admin_reg_event_conferences = @admin_reg_event_conferences
    
    
  end
  
  
  def dbdelete
      RegEventConference.dbdelete
      redirect_to action: "index"
      # render text: 'dbdelete'
  end
  
  def dbclear
      RegEventConference.dbclear
      redirect_to action: "index"
      # render text: 'dbclear'
  end
  
  def export
    
    # render text: 'export'
    
    # @stores = Store.where(params[:export])

    @admin_reg_event_conferences = @@admin_reg_event_conferences
 
  
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
    @admin_reg_event_conference = RegEventConference.find(params[:id])    
    # @admin_reg_event_conference_next = RegEventConference.next(params[:id])
    # @admin_reg_event_conference_previous = RegEventConference.previous(params[:id])

    @admin_reg_event_conference_next = @admin_reg_event_conference.next
    @admin_reg_event_conference_previous = @admin_reg_event_conference.previous


    
    # BlogEntry.where(:lang => lang).where("id > ?", self.id).first
    # @admin_reg_event_conference_next = RegEventConference.where("id > ?", @admin_reg_event_conference.id).first
    
    # @admin_reg_event_conference_previous = RegEventConference.previous(@admin_reg_event_conference)
    # @admin_reg_event_conference_next = RegEventConference.next(@admin_reg_event_conference)
    
    #@id_next = RegEventConference.maximum(params[:id]) + 1
    
    # @picture = Picture.find(params[:id])
    # @previous_picture = Picture.previous(@picture)
    # @next_picture = Picture.next(@picture)

    
    # @same_category = Post.same_category(@object.category_id)
    # record_next = @admin_reg_event_conference.next(@post.id).first
    # record_prev = @admin_reg_event_conference.previous(@post.id).first    

  end
  
  def create
  end
  
  def edit
    @admin_reg_event_conference = RegEventConference.find_by_id(params[:id])    
  end
  
  def update
    
    @admin_reg_event_conference = RegEventConference.find(params[:id])
    
    if @admin_reg_event_conference.update_attributes(params[:admin_reg_event_conference])
      redirect_to(:action => 'show', :saved_id => @admin_reg_event_conference.id)
    else
      render text: 'update failed'
    end    
  end

  def delete
    # @contact = Contact.find(params[:id])
  end


  def destroy

    # Rails.logger.info('in destroy')
    
    admin_reg_event_conference = RegEventConference.find(params[:id])
    if admin_reg_event_conference.delete
      redirect_to(admin_reg_event_conferences_index_path)
      # render text: 'delete succeded'
    else
      render text: 'delete failed'
    end
    
  end


  # def destroy_record
  # end
  
  # def confirm_logged_in
    # unless session[:user_id]
      # flash[:notice] = "Please log in."
      # redirect_to(login_path)
      # return false # halts the before_filter
    # else
      # #redirect_to(:controller => 'admin_users', :action => 'list')
      # return true
    # end
  # end
  
  # def get_message
    # respond_to do |format|
      # format.html
      # format.js      
    # end    
  # end

  
  private

    def admin_reg_event_conference_params
      params.require(:admin_reg_event_conference).permit(
                                                          :name_first, 
                                                          :name_last, 
                                                          :name_title,
                                                          :position_title, 
                                                          :type_affiliation, 
                                                          :name_affiliation, 
                                                          :address, 
                                                          :city, 
                                                          :state, 
                                                          :zip, 
                                                          :phone,
                                                          :phone_mobile, 
                                                          :email, 
                                                          :topic,
                                                          :description
                                                        )
          
    end
  
  
    def sort_column
      RegEventConference.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
  
  
  
end
