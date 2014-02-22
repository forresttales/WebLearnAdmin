class Mtab1letsController < ApplicationController

  respond_to :html, :js, :json  

  require 'csv'

  layout 'mtablet'
  
  helper_method :sort_column, :sort_direction
  
  
  @@mtab1lets = nil
  @@delete = false
  @@s = ''
  
  def index
    
    # if params[:id_export] == '1'
#       
        # @mtab1lets = Mtab1let.where(:id => '70')
#           
        # respond_to do |format|
#           
          # # if format == format.csv
            # # @mtab1lets = Mtab1let.where(:id => '70')
          # # end
#           
          # format.html
          # # format.csv
          # format.js
        # end
    # end    
    
    # @mtab1lets = null
    
    s = 's'
    search_by = ''
    search = ''
    search_by_text = ''
    
    
    if params[:search_by].nil? and params[:export].nil? and @@delete == false
      @mtab1lets = Mtab1let.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      @@mtab1lets = @mtab1lets
      
    elsif !params[:export].nil? and @@delete == false
      
      export = params[:export]
      @mtab1lets = Mtab1let.where(params[:export]).paginate(:per_page => 200, :page => params[:page])
      #@mtab1lets = Mtab1let.where(:id => export.id)
    elsif !params[:search_by].nil? and @@delete == false

      # @mtab1lets = Mtab1let.where(:id => '99')
      
      search_by = params[:search_by].to_s
      search = params[:search].to_s
      
      case search_by
      when "1"
        search_by_text = 'id'
      when "2"
        search_by_text = 'col_1'
      when "3"
        search_by_text = 'col_2'
      when "4"
        search_by_text = 'col_3'
      when "5"
        search_by_text = 'col_4'
      when "6"
        search_by_text = 'col_5'
      when "7"
        search_by_text = 'col_6'
      when "8"
        search_by_text = 'col_7'
      when "9"
        search_by_text = 'col_8'
      when "10"
        search_by_text = 'col_9'
      when "11"
        search_by_text = 'col_10'
      when "12"
        search_by_text = 'col_11'
      when "13"
        search_by_text = 'col_12'
      when "14"
        search_by_text = 'col_13'
      when "15"
        search_by_text = 'col_14'
      when "16"
        search_by_text = 'col_15'
      when "17"
        search_by_text = 'col_16'
      when "18"
        search_by_text = 'col_17'
      when "19"
        search_by_text = 'col_18'
      when "20"
        search_by_text = 'col_19'
      when "21"
        search_by_text = 'col_20'
      when "22"
        search_by_text = 'col_21'
      when "23"
        search_by_text = 'col_22'
      when "24"
        search_by_text = 'col_23'
      when "25"
        search_by_text = 'col_24'
      when "26"
        search_by_text = 'col_25'
      else
        #
      end
      
      if search_by_text == 'id'
        s = "id=" + search
      else
        s = search_by_text + " LIKE '" + search + "'"
      end
      
      @@s = s
      
      @mtab1lets = Mtab1let.search_by_sql(s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      
    elsif @@delete == true
      
      # if @@s != ''
        # @mtab1lets = Mtab1let.search_by_sql(@@s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      # else
        @mtab1lets = Mtab1let.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      #end
    else
      #
    end    
    
    @@delete = false
    
    @@mtab1lets = @mtab1lets

    respond_to do |format|
      format.html
      format.csv
      format.js
    end

        
  end

  def dbdelete
      Mtab1let.dbdelete
      Mtab1let.dbclear
      
      redirect_to action: "index"
      
      # redirect_to(:action => 'index')
      
      # respond_to do |format|
        # format.js
        # format.html
      # end

      # redirect_to action: "index"
      # render text: 'dbdelete'
  end
  
  def dbclear
      Mtab1let.dbclear
      redirect_to action: "index"
      # render text: 'dbclear'
  end
  
  def export
    
    # render text: 'export'
    
    # @mtab1lets = Mtab1let.where(params[:export])

    @mtab1lets = @@mtab1lets
 
  
    respond_to do |format|
      format.html
      format.csv
       #format.js
    end
    
  end
  
  

  def import
    
    file_name = params[:file_name]

    headers = [
      "col_1",
      "col_2",
      "col_3",
      "col_4",
      "col_5",
      "col_6",
      "col_7",
      "col_8",
      "col_9",
      "col_10",
      "col_11",
      "col_12",
      "col_13",
      "col_14",
      "col_15",
      "col_16",
      "col_17",
      "col_18",
      "col_19",
      "col_20",
      "col_21",
      "col_22",
      "col_23",
      "col_24",
      "col_25",
      "col_26",
      "col_27",
      "col_28",
      "col_29",
      "col_30",
      "col_31",
      "col_32",
      "col_33",
      "col_34",
      "col_35",
      "col_36",
      "col_37",
      "col_38",
      "col_39",
      "col_40",
      "col_41",
      "col_42",
      "col_43",
      "col_44",
      "col_45",
      "col_46",
      "col_47",
      "col_48",
      "col_49",
      "col_50"
    ]
 
    ActiveRecord::Base.establish_connection
 
    # send_file "#{Rails.root}/public/downloads/test.htm"    

    file_dir = 'public/mtab1let/' + file_name

    CSV.foreach(Rails.root.join(file_dir), {headers: :first_row}) do |row|

    # CSV.foreach(file_dir, {headers: :first_row}) do |row|
      
      sql_keys = []
      sql_vals = []
 
      created_at = Time.now.strftime("%Y-%m-%d %H:%M:%S")
 
      headers.each_with_index do |key, idx|
        val = row[idx]
 
        sql_keys << key
        sql_vals << ActiveRecord::Base.connection.quote(val)
      end
 
      sql = "
        INSERT INTO mtab1lets (#{sql_keys.join(', ')}, created_at, updated_at)
        VALUES (#{sql_vals.join(', ')}, '#{created_at}', '#{created_at}')
      "
 
      res = ActiveRecord::Base.connection.execute(sql)
    end
    
    # respond_to do |format|
      # format.js
      # format.html
    # end
    
    redirect_to action: "index"
    
  end


  def show
    @mtab1let = Mtab1let.find(params[:id])
    #@mtab1let = Mtab1let.find(1)
    
    respond_to do |format|
      format.js
      format.html
    end

  end


  def new
    @mtab1let = Mtab1let.new    
    
    respond_to do |format|
      format.js
      format.html
    end
    
  end

  
  def create

    mtab1let = Mtab1let.new(mtab1lets_params)
    if mtab1let.save
      redirect_to(:action => 'index')
    else
      render text: 'save failed'
      #render("new")
    end

    # respond_to do |format|
      # format.js
      # format.html
    # end

  end

  
  def edit
    @mtab1let = Mtab1let.find_by_id(params[:id])    
    #@mtab1let = Mtab1let.find_by_id(1)    

    respond_to do |format|
      format.js
      format.html
    end

  end

  
  def update
    
    mtab1let = Mtab1let.find(params[:id])
    
    if mtab1let.update_attributes(params[:mtab1let])

      respond_to do |format|
        format.js { redirect_to(:action => 'show', :id => mtab1let.id, :form => :js ) }
        format.html
      end

      # redirect_to(:action => 'show', :id => mtab1let.id)

    else
      render text: 'update failed'
    end    
    
  end


  def delete
    # @contact = Contact.find(params[:id])
  end


  def destroy
     
    @mtab1let = Mtab1let.find(params[:id])
    if @mtab1let.delete
      # @@delete = true
      @mtab1lets = Mtab1let.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])      
      render 'index'
    else
      render text: 'delete failed'
    end
     
  end
  

  
  
  private

    def mtab1lets_params
      params.require(:mtab1let).permit(
                                    :col_1,
                                    :col_2,
                                    :col_3,
                                    :col_4,
                                    :col_5,
                                    :col_6,
                                    :col_7,
                                    :col_8,
                                    :col_9,
                                    :col_10,
                                    :col_11,
                                    :col_12,
                                    :col_13,
                                    :col_14,
                                    :col_15,
                                    :col_16,
                                    :col_17,
                                    :col_18,
                                    :col_19,
                                    :col_20,                  
                                    :col_21,                  
                                    :col_22,                  
                                    :col_23,                  
                                    :col_24,                  
                                    :col_25,           
                                    :col_26,
                                    :col_27,
                                    :col_28,
                                    :col_29,
                                    :col_30,
                                    :col_31,
                                    :col_32,
                                    :col_33,
                                    :col_34,
                                    :col_35,
                                    :col_36,
                                    :col_37,
                                    :col_38,
                                    :col_39,
                                    :col_40,
                                    :col_41,
                                    :col_42,
                                    :col_43,
                                    :col_44,
                                    :col_45,
                                    :col_46,
                                    :col_47,
                                    :col_48,
                                    :col_49,
                                    :col_50,                                           
                                    :created_at,
                                    :updated_at  
                                    )
          
    end
  
  
    def sort_column
      Mtab1let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end


end
