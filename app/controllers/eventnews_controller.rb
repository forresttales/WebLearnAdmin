class EventnewsController < ApplicationController

  layout 'eventnew'
  
  helper_method :sort_column, :sort_direction
  
  
  def index
    
    #search_by = nil
    
    # search_by = params[:search_by]
# 
    # render text: 'search_by'

    
    if params[:search_by].nil?
      @eventnews = Eventnew.order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])

    elsif params[:search_by] == '1'
      @eventnews = Eventnew.search_id(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
      
    elsif params[:search_by] == '2'
      @eventnews = Eventnew.search_article_id(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
      
    elsif params[:search_by] == '3'
      @eventnews = Eventnew.search_name_file(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])

    else
      render text: 'error'        
    end
    
  end

  
  def event_1_photos
    
  end


  def list
    
  end


  def new
    @eventnew = Eventnew.new
  end
  
  
  def create

    @eventnew = Eventnew.new(eventnew_params)
    if @eventnew.save
      render 'index'
    else
      render 'new'
    end

  end


  def show
    render text: 'show'
    # @eventnew = Eventnew.find(params[:id])
  end


  def edit
    @eventnew = Eventnew.find_by_id(params[:id])    
  end

  
  def update
    
    @eventnew = Eventnew.find(params[:id])
    
    if @eventnew.update_attributes(params[:eventnew])
      redirect_to(:action => 'show', :saved_id => @eventnew.id)
    else
      # @subject_count = Subject.count
      render text: 'update failed'
    end    
  end

  
  def delete
    # @contact = Contact.find(params[:id])
  end


  def destroy
    eventnew = Eventnew.find(params[:id])
    eventnew.delete
    redirect_to(eventnews_list_path)
  end


  
  private

    def eventnew_params
      params.require(:eventnew).permit(
                                        :article_id, 
                                        :name_url, 
                                        :name_file, 
                                        :name_author, 
                                        :name_admin, 
                                        :key_words, 
                                        :date_article, 
                                        :article_type, 
                                        :description,
                                        :linkimg, 
                                        :linkimg_url, 
                                        :linktitle,
                                        :slug
                                      )
      
    end
  
  
    def sort_column
      Eventnew.column_names.include?(params[:sort]) ? params[:sort] : "name_file"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end


end
