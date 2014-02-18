class ShareFilesController < ApplicationController
  
  layout 'admin_users'

  # def index
  # end

  def list

    @share_files = ShareFile.paginate(page: params[:page]).per_page(30)
        
  end
  
  def show
    
      file = params[:file]
      
      send_file "#{Rails.root}/public/uploads/" + file    
    
  end
  
  def edit
    
  end
  
  def destroy
    
  end
  
  def update
    
  end
  
  
  # private
# 
    # def share_file_params
      # params.require(:share_file).permit(:id, :name_originator, :name_file, :created_at, :updated_at)
    # end
  
end
