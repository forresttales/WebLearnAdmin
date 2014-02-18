class DownloadsController < ApplicationController


  layout 'application'
  
  def index

  end
  
  def show
    
      send_file "#{Rails.root}/public/downloads/test.htm"    
    
  end

end
