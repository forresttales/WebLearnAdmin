class HitCountsController < ApplicationController

    layout 'item_register'
  
    helper_method :sort_column, :sort_direction


    def index
      
        if params[:search_by].nil?
            @hit_counts = HitCount.order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
            # elsif params[:search_by] == '1'
              # @archives = Archive.search_id(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
        else
          render text: 'error'        
        end

    end
    
    def delete
    end
  
  
    def destroy
      
      hit_count = HitCount.find(params[:id])
      if hit_count.delete
        redirect_to(hit_counts_index_path)
      else
        render text: 'delete failed'
      end
      
    end

    
    
    private
  
    
      def sort_column
        HitCount.column_names.include?(params[:sort]) ? params[:sort] : "id"
      end
      
      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
      end
    

end
