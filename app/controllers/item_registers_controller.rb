class ItemRegistersController < ApplicationController

  layout 'item_register'
  
  helper_method :sort_column, :sort_direction
  
  
  def index
    
    if params[:search_by].nil?
      @item_registers = ItemRegister.order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
    # elsif params[:search_by] == '1'
      # @archives = Archive.search_id(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
    # elsif params[:search_by] == '2'
      # @archives = Archive.search_article_id(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
    # elsif params[:search_by] == '3'
      # @archives = Archive.search_name_file(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
    else
      render text: 'error'        
    end
    
  end


  def list
  end


  def new
    
    max_id = ItemRegister.maximum(:id) rescue nil
    if !max_id.nil?
      @item_register_next_new_id = ItemRegister.maximum(:id).next
    else
      # Rails.logger.info('max id nil')
      @item_register_next_new_id = 1
    end
    
  end
  
  
  def create

    item_register = ItemRegister.new
    if item_register.save
      redirect_to :controller => 'item_registers', :action => 'edit', :id => item_register.id
      # redirect_to '/item_registers/:id/edit'
    else
      render 'new'
    end

  end


  def show
    
    @item_register = ItemRegister.find(params[:id])
    @item_register_next = @item_register.next
    @item_register_previous = @item_register.previous
    
    # if request.path != item_register_path(@info)
      # redirect_to @info, status: :moved_permanently
    # end    
  end


  def edit
    @item_register = ItemRegister.find_by_id(params[:id])
    @admin = current_user.name_first + ' ' + current_user.name_last     
  end

  
  def update
    
    @item_register = ItemRegister.find(params[:id])
    
    if @item_register.update_attributes(params[:item_register])
      
      redirect_to(:action => 'show', :saved_id => @item_register.id)
      
    else
      # @subject_count = Subject.count
      render text: 'update failed'
    end    
  end

  
  def delete
    # @item_register = ItemRegister.find(params[:id])
  end

  def destroy
    
    item_register = ItemRegister.find(params[:id])
    if item_register.delete
      redirect_to(item_registers_index_path)
    else
      render text: 'delete failed'
    end 

  end

  
  private

    def item_register_params
      params.require(:item_register).permit(:article_id, :name_url, :name_file, :name_author, :name_admin, 
                                      :key_words, :date_article, :article_type, :description, 
                                      :linkimg, :linkimg_url, :linktitle, :slug )
    end
  
  
    def sort_column
      ItemRegister.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end


end
