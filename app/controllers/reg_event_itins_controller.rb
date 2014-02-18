class RegEventItinsController < ApplicationController
  
  require 'csv'
  
  layout 'reg_event_itin'
  
  helper_method :sort_column, :sort_direction
  
  
  @@reg_event_itins = nil

  def index
    
      #@reg_event_itins = RegEventItin.find(:all, :order => "date_event ASC")
      
      @reg_event_itins = RegEventItin.order(sort_column + " " + sort_direction)
      
      
      @@reg_event_itins = @reg_event_itins
  end


  def new
    @reg_event_itin = RegEventItin.new
  end
  
  
  def create

    @reg_event_itin = RegEventItin.new(reg_event_itin_params)
    if @reg_event_itin.save
      redirect_to(:action => 'show', :id => @reg_event_itin.id)
    else
      render 'new'
    end

  end


  def show
    @reg_event_itin = RegEventItin.find(params[:id])
  end


  def edit
    @reg_event_itin = RegEventItin.find_by_id(params[:id])    
    
    #@reg_event_itin.date_event = @reg_event_itin.date_event.to_s(:long) 
  end

  
  def update
    
    @reg_event_itin = RegEventItin.find(params[:id])
    
    if @reg_event_itin.update_attributes(params[:reg_event_itin])
      # redirect_to(:action => 'show', :saved_id => @reg_event_itin.id)
      redirect_to(:action => 'show', :id => @reg_event_itin.id)      
    else
      render text: 'update failed'
    end    
  end

  
  def delete
    @reg_event_itin = RegEventItin.find(params[:id])
  end


  def destroy
    
    reg_event_itin = RegEventItin.find(params[:id])
    reg_event_itin.delete
    redirect_to 'index'
    
  end


  def dbdelete
    #render text: 'dbdelete'
     RegEventItin.dbdelete
     redirect_to action: "index"
  end
  
  def dbclear
    #render text: 'dbclear'
    RegEventItin.dbclear
    redirect_to action: "index"
  end


  def export
    
    render text: 'export'
    # @stores = Store.where(params[:export])
    # @stores = @@stores
    # respond_to do |format|
      # format.html
      # format.csv
       # #format.js
    # end
    
  end


  
  private

    def reg_event_itin_params
      params.require(:reg_event_itin).permit(
                                            :city_state,
                                            :date_event,
                                            :date_event_text, 
                                            :address,
                                            :order_display
                                            )
    end
  
  
    def sort_column
      RegEventItin.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
end
