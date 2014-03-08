class Mtab8letsController < ApplicationController
  
  respond_to :html, :js, :json  

  require 'csv'

  layout 'mtablet'
  
  helper_method :sort_column, :sort_direction, :yesno
  
  
  @@mtab8lets = nil
  @@delete = false
  @@s = ''
  
  def index
    
    s = 's'
    search_by = ''
    search = ''
    search_by_text = ''
    
    if params[:search_by].nil? and params[:export].nil? and @@delete == false

      @mtab8lets = Mtab8let.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      @@mtab8lets = @mtab8lets
      
    elsif !params[:export].nil? and @@delete == false
      
      export = params[:export]
      @mtab8lets = Mtab8let.where(params[:export]).paginate(:per_page => 200, :page => params[:page])

    elsif !params[:search_by].nil? and @@delete == false

      search_by = params[:search_by].to_s
      search = params[:search].to_s
      
      case search_by
      when "0"
        search_by_text = 'id'
      when "1"
        search_by_text = 'col_1'
      when "2"
        search_by_text = 'col_2'
      when "3"
        search_by_text = 'col_3'
      when "4"
        search_by_text = 'col_4'
      when "5"
        search_by_text = 'col_5'
      when "6"
        search_by_text = 'col_6'
      when "7"
        search_by_text = 'col_7'
      when "8"
        search_by_text = 'col_8'
      when "9"
        search_by_text = 'col_9'
      when "10"
        search_by_text = 'col_10'
      when "11"
        search_by_text = 'col_11'
      when "12"
        search_by_text = 'col_12'
      when "13"
        search_by_text = 'col_13'
      when "14"
        search_by_text = 'col_14'
      when "15"
        search_by_text = 'col_15'
      when "16"
        search_by_text = 'col_16'
      when "17"
        search_by_text = 'col_17'
      when "18"
        search_by_text = 'col_18'
      when "19"
        search_by_text = 'col_19'
      when "20"
        search_by_text = 'col_20'
      when "21"
        search_by_text = 'col_21'
      when "22"
        search_by_text = 'col_22'
      when "23"
        search_by_text = 'col_23'
      when "24"
        search_by_text = 'col_24'
      when "25"
        search_by_text = 'col_25'
      when "26"
        search_by_text = 'col_26'
      when "27"
        search_by_text = 'col_27'
      when "28"
        search_by_text = 'col_28'
      when "29"
        search_by_text = 'col_29'
      when "30"
        search_by_text = 'col_30'
      when "31"
        search_by_text = 'col_31'
      when "32"
        search_by_text = 'col_32'
      when "33"
        search_by_text = 'col_33'
      when "34"
        search_by_text = 'col_34'
      when "35"
        search_by_text = 'col_35'
      when "36"
        search_by_text = 'col_36'
      when "37"
        search_by_text = 'col_37'
      when "38"
        search_by_text = 'col_38'
      when "39"
        search_by_text = 'col_39'
      when "40"
        search_by_text = 'col_40'
      when "41"
        search_by_text = 'col_41'
      when "42"
        search_by_text = 'col_42'
      when "43"
        search_by_text = 'col_43'
      when "44"
        search_by_text = 'col_44'
      when "45"
        search_by_text = 'col_45'
      when "46"
        search_by_text = 'col_46'
      when "47"
        search_by_text = 'col_47'
      when "48"
        search_by_text = 'col_48'
      when "49"
        search_by_text = 'col_49'
      when "50"
        search_by_text = 'col_50'
      else
        #
      end
      
      if search_by_text == 'id'
        s = "id=" + search
      else
        s = search_by_text + " LIKE '" + search + "'"
      end
      
      @@s = s
      
      @mtab8lets = Mtab8let.search_by_sql(s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      
    elsif @@delete == true
      
      # if @@s != ''
        # @mtab8lets = Mtab8let.search_by_sql(@@s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      # else
        @mtab8lets = Mtab8let.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      #end
    else
      #
    end    
    
    @@delete = false
    
    @@mtab8lets = @mtab8lets

    respond_to do |format|
      format.html
      format.csv
      format.js
    end

        
  end

  def dbdelete
      Mtab8let.dbdelete
      Mtab8let.dbclear
      
      redirect_to action: "index"
  end
  
  def dbclear
      Mtab8let.dbclear
      redirect_to action: "index"
  end
  
  def export
    @mtab8lets = @@mtab8lets
  
    respond_to do |format|
      format.html
      format.csv
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
 
    file_dir = 'public/mtab8let/' + file_name

    CSV.foreach(Rails.root.join(file_dir), {headers: :first_row}) do |row|
      
      sql_keys = []
      sql_vals = []
 
      created_at = Time.now.strftime("%Y-%m-%d %H:%M:%S")
 
      headers.each_with_index do |key, idx|
        val = row[idx]
 
        sql_keys << key
        sql_vals << ActiveRecord::Base.connection.quote(val)
      end
 
      sql = "
        INSERT INTO mtab8lets (#{sql_keys.join(', ')}, created_at, updated_at)
        VALUES (#{sql_vals.join(', ')}, '#{created_at}', '#{created_at}')
      "
 
      res = ActiveRecord::Base.connection.execute(sql)
    end
    
    redirect_to action: "index"
    
  end


  def show
    @mtab8let = Mtab8let.find(params[:id])
    
    respond_to do |format|
      format.js
      format.html
    end

  end


  def new
    @mtab8let = Mtab8let.new    
    
    respond_to do |format|
      format.js
      format.html
    end
    
  end

  
  def create

    mtab8let = Mtab8let.new(mtab8lets_params)
    if mtab8let.save
      redirect_to(:action => 'index')
    else
      render text: 'save failed'
      #render("new")
    end

  end

  
  def edit

    @mtab8let = Mtab8let.find_by_id(params[:id])    

    respond_to do |format|
      format.js
      format.html
    end

  end

  
  def update
    
    mtab8let = Mtab8let.find(params[:id])
    
    if mtab8let.update_attributes(params[:mtab8let])

      respond_to do |format|
        format.js { redirect_to(:action => 'show', :id => mtab8let.id, :form => :js ) }
        format.html
      end

    else
      render text: 'update failed'
    end    
    
  end


  def delete
    # @contact = Contact.find(params[:id])
  end


  def destroy
     
    @mtab8let = Mtab8let.find(params[:id])

    if @mtab8let.delete
      # @@delete = true
      @mtab8lets = Mtab8let.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])      
      render 'index'
    else
      render text: 'delete failed'
    end
     
  end
  

  def export
    
    # @mtablets = Mtablet.where(params[:export])

    @mtab8lets = @@mtab8lets
  
    respond_to do |format|
      format.html
      format.csv
       #format.js
    end
    
  end

  
  
  private

    def mtab8lets_params
      params.require(:mtab8let).permit(
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
      Mtab8let.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def yesno(x)
      x == 1 ? "Yes" : "No"
    end

  
end
