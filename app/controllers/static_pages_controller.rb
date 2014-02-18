class StaticPagesController < ApplicationController
  
  layout 'application'
  
  def home
    
  end
  
  
  def download

    #@document = Document.find(params[:id])
    #@filepath = @document.full_filename

    @filepath = '../share/test.htm'
    send_file(@filepath,
    :disposition => 'attachment',
    :encoding => 'utf8',
    :type => 'application/octet-stream')

  end
  
  
  def about
    
  end
  
  def edmatchup
    
  end
  
  def events
    
  end
  
  def help
    
  end
  
  def news
    
  end
  
  def reports
    
  end
  
  def report
    render text: 'in report'
  end
  
  def show
    
    
    # @filepath = 'share/test.htm'
    # send_file(@filepath,
    # :disposition => 'attachment',
    # :encoding => 'utf8',
    # :type => 'application/octet-stream')
    
    
    
    #@document.path = 'share/test.htm'
    # send_file "#{Rails.root}/public/share/test.htm"    

    #send_file "../share/test.htm", :type => "application/pdf", :filename => "Report0.pdf"    

    
    #id_sent = params[:id]
    
    # @article = Article.where(["article_id = ?", params[:id]]).first       
#     
    # render text: @article.name_file
#     
    # render text: 'in show id ' + id_sent
    
    #render :file => "journals/pearson"
  end
  
  def getPartial
    
    # render :partial => "http://localhost:3000/journal/pearson"
  end
end

