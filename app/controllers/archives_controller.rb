class ArchivesController < ApplicationController
  
  layout 'archive'
  
  helper_method :sort_column, :sort_direction
  
  def index
    
    #search_by = nil
    
    # search_by = params[:search_by]
# 
    # render text: 'search_by'

    
    if params[:search_by].nil?
      @archives = Archive.order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])

    elsif params[:search_by] == '1'
      @archives = Archive.search_id(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
      
    elsif params[:search_by] == '2'
      @archives = Archive.search_article_id(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
      
    elsif params[:search_by] == '3'
      @archives = Archive.search_name_file(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])

    else
      render text: 'error'        
    end
    
  end

  def list

    # @products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])

    # @archives = Archive.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
 
    # @archives = Archive.paginate(page: params[:page]).per_page(50)
    
  end

  def new
    #@account_type = params[:id]
    @archive = Archive.new
    
  end
  
  
  
  def create

    @archive = Archive.new(archive_params)
    if @archive.save
      #flash[:success] = "Record saved"
      render 'index'
    else
      #flash.now[:notice] = "Record failed"
      render 'new'
    end

  end

  def show
    
    @archive = Archive.find(params[:id])
    
    # if request.path != archive_path(@info)
      # redirect_to @info, status: :moved_permanently
    # end    
    
    #@info = Archive.where(["article_id = ?", params[:id]]).first       
    #render text: @info.name_file
    #gon.info = @info
    #render :file => "journal/pearson"
  end

  def edit
    @archive = Archive.find_by_id(params[:id])    
  end
  
  def update
    
    @archive = Archive.find(params[:id])
    
    if @archive.update_attributes(params[:archive])
      # redirect_to(:action => 'show', :saved_id => @archive.id)
      
      redirect_to(:action => 'show', :saved_id => @archive.id)
      
    else
      # @subject_count = Subject.count
      render text: 'update failed'
    end    
  end

  
  def delete
    # @contact = Contact.find(params[:id])
  end

  def destroy
    
    archive = Archive.find(params[:id])
    archive.delete
    redirect_to(archives_list_path)
    
    # contact = Contact.find(params[:id])
    # contact.delete
    # flash[:notice] = "Contact destroyed."
  end

  # def sortable(column, title = nil)
    # title ||= column.titleize
    # css_class = column == sort_column ? "current #{sort_direction}" : nil
    # direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    # link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  # end
  
  #  linkimg      :string(50)
#  linkimg_url  :string(50)
#  linktitle    :string(200)

  
  private

    def archive_params
      params.require(:archive).permit(:article_id, :name_url, :name_file, :name_author, :name_admin, 
                                      :key_words, :date_article, :article_type, :description, 
                                      :linkimg, :linkimg_url, :linktitle, :slug )
    end
  
  
    def sort_column
      Archive.column_names.include?(params[:sort]) ? params[:sort] : "name_file"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
end
