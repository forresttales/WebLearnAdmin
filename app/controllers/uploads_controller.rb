class UploadsController < ApplicationController
  
  layout 'application'
  
  def index
     render :file => 'app/views/uploads/upload.html.erb'
  end
  
  # def upload
#     
  # end

  def new
    
  end

  def upload

   
   post = DataFile.save(params[:upload_file])
   render :text => "File has been uploaded successfully"
    # File.open("..downloads/test", "r").each_line do |line|


    # File.open("#{Rails.root}/public/downloads/test.txt", "r").each_line do |line|
      # render text: line
    # end

 #{Rails.root}/public/downloads/test.htm

    # uploaded_io = params[:upload_file]
# 
    # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      # file.write(uploaded_io.read)
    # end
# 
    # upload = Upload.new
    # upload.name_file = uploaded_io.original_filename
    # upload.name_originator = session[:username]
# 
    # if upload.save
        # session[:upload_status] = true
    # else
        # session[:upload_status] = false
    # end    
#     
    # render 'create'
    
    
  end


  def create
    
  end

  def show
    
     render 'upload'
    
  end    

  # private
# 
    # def upload_params
      # params.require(:upload).permit(:name_originator, :name_file)
    # end
    
end
