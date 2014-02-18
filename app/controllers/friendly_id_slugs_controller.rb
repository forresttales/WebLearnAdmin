class FriendlyIdSlugsController < ApplicationController
  
  layout 'archive'
  
  helper_method :sort_column, :sort_direction
  
  def index
        
    if params[:search_by].nil?
      @friendlyidslugs = FriendlyIdSlug.order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])

    elsif params[:search_by] == '1'
      @friendlyidslugs = FriendlyIdSlug.search_id(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
      
    elsif params[:search_by] == '2'
      @friendlyidslugs = FriendlyIdSlug.search_sluggable_id(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
      
    elsif params[:search_by] == '3'
      @friendlyidslugs = FriendlyIdSlug.search_slug(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])

    else
      render text: 'error'        
    end
    
  end

  def list
  end

  def new
    @friendlyidslug = FriendlyIdSlug.new
  end
  
  
  
  def create

    # @friendlyidslug = FriendlyIdSlug.new(friendlyidslug_params)
    
    # @friendlyidslug = FriendlyIdSlug.new({"utf8"=>"✓",
                                          # "authenticity_token"=>"yCftlfo7hyR2qvzDcVXY55CdUds4YEvCdrmruxn2gUw=",
                                          # "friendly_id_slug"=>{"slug"=>"50000",
                                          # "sluggable_id"=>"38",
                                          # "sluggable_type"=>"Archive",
                                          # "scope"=>""},
                                          # "commit"=>"Submit"})
    
    @friendlyidslug = FriendlyIdSlug.new
    
    
    if @friendlyidslug.save
      
      # render text: @friendlyidslug.id
      
      redirect_to :controller => 'friendly_id_slugs', :action => 'edit', :id => @friendlyidslug.id 
      
      # redirect_to edit_friendly_id_slugs_path({:id => @friendlyidslug.id})
      # render 'index'

    else
      #flash.now[:notice] = "Record failed"
      render 'new'
    end

  end

  def show
    
    @friendlyidslug = FriendlyIdSlug.find(params[:id])
    
    # if request.path != archive_path(@info)
      # redirect_to @info, status: :moved_permanently
    # end    
    
    #@info = Archive.where(["article_id = ?", params[:id]]).first       
    #render text: @info.name_file
    #gon.info = @info
    #render :file => "journal/pearson"
  end

  def edit
    @friendlyidslug = FriendlyIdSlug.find_by_id(params[:id])    
  end
  
  def update
    
    @friendlyidslug = FriendlyIdSlug.find(params[:id])
    
    if @friendlyidslug.update_attributes(params[:friendlyidslug])
      # redirect_to(:action => 'show', :saved_id => @archive.id)
      
      redirect_to(:action => 'show', :saved_id => @friendlyidslug.id)
      
    else
      # @subject_count = Subject.count
      render text: 'update failed'
    end    
  end

  
  def delete
    # @contact = Contact.find(params[:id])
  end

  def destroy    
    friendlyidslug = FriendlyIdSlug.find(params[:id])
    friendlyidslug.delete
    redirect_to(:action => 'index')
  end

  
  private

    def friendlyidslug_params
      params.require(:friendlyidslug).permit( :slug, :sluggable_id, :sluggable_type, :scope )
    end
  
  
    def sort_column
      FriendlyIdSlug.column_names.include?(params[:sort]) ? params[:sort] : "slug"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
  
  
  
end
