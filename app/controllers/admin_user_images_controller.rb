class AdminUserImagesController < ApplicationController
  
  layout 'admin_user_profile'

  # layout 'admin_user_image'
  
  def index
    
    images = AdminUserImage.where("admin_user_id = ?", session[:admin_user_id])       

    # images         = AdminUserImage.where("admin_user_images.admin_user_id = ? AND admin_user_images.primary = ?", session[:admin_user_id], false)       
    # images_primary = AdminUserImage.where("admin_user_images.admin_user_id = ? AND admin_user_images.primary = ?", session[:admin_user_id], true)       

   #admin_user_image          = AdminUserImage.where("admin_user_images.admin_user_id = ? AND admin_user_images.primary = ?", session[:admin_user_id], true)       

    prim_index = 0
    prim_id    = 0
    aimages = Array.new
    aimages_prim = Array.new
    aimages_all = Array.new
    
    for i in 0..(images.count - 1)
      # aimages_all.insert(0, images[i])      
      if images[i].primary
        prim_index = i
        prim_id = images[i].id
        aimages_prim.insert(0, images[i])          
      else
        aimages.insert(0, images[i])
        aimages_all.insert(0, images[i])      
      end
    end
    
    aimages_all.insert(0, aimages_prim[0])      
    
    
    
    gon.aimages_all = aimages_all

    @admin_user_images = aimages_all
    
    gon.prim_index = prim_index
    gon.prim_id = prim_id
    
    gon.admin_user_images = @admin_user_images
    gon.admin_user_images_count = @admin_user_images.count


    # gon.aimage_count = aimages.length
    # gon.aimage_prim_count = aimages_prim.length
    
    # image_prim = images.pop(images[prim])

    # @admin_user_images = images.insert(images_primary[0])

    #@primary_id = admin_user_images_primary[0].id
    #@primary_name = admin_user_images_primary[0].image_name

    # prim = 0
    # for i in 0..(admin_user_images.count - 1)
      # if admin_user_images[i].primary
        # prim = i
      # end
    # end

    # render text: @admin_user_images.count
    
  end

  
  def new
    
    # @admin_user_image = AdminUserImage.new
    
  end


  def upload

    uploaded_io = params[:upload_file]

    File.open(Rails.root.join('public', 'photos', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    admin_user_image = AdminUserImage.new
    admin_user_image.image_name = uploaded_io.original_filename
    admin_user_image.admin_user_id = session[:admin_user_id]
    
    if admin_user_image.save
        session[:admin_user_image_upload_status] = true
    else
        session[:admin_user_image_upload_status] = false
    end    
    
    render 'create'
    
    
  end


  def create
    
    @admin_user_image = AdminUser.new(admin_user_image_params)
    if @admin_user_image.save
        
        redirect_to action: "index"
        
    else
      render 'new'
    end
    
    
  end


  def show
    
     # render 'upload'
    
  end    


  def destroy
     
     # render text: 'destroy'
     
    admin_user_image = AdminUserImage.find(params[:id])
    if admin_user_image.delete
      
        File.delete(Rails.root.join('public', 'photos', admin_user_image.image_name))
        # File.delete(Rails.root + '/foo.jpg')
      
      redirect_to(admin_user_images_index_path)
    else
      render text: 'delete failed'
    end
     
  end


  def set_primary

    admin_user_images = AdminUserImage.where("admin_user_id = ?", session[:admin_user_id])       
 
    for i in 0..(admin_user_images.count - 1)
      admin_user_images[i].primary = false
      if admin_user_images[i].save
        
      else 
        render text: 'update images to false has failed'
      end
      
    end


    admin_user_image_updated = AdminUserImage.find(params[:id])
    admin_user_image_updated.primary = true
    if admin_user_image_updated.save
      redirect_to action: "index"
    else
      render text: 'set primary failed'
    end
        
  end



  private

    def admin_user_image_params
      params.require(:admin_user_image).permit(      
                                          :admin_user_id, 
                                          :image_name 
                                        )
                                        
    end

  
end
