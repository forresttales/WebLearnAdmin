class Mtab8letsController < ApplicationController
  
  respond_to :html, :js, :json  

  require 'csv'

  layout 'mtablet'
  
  helper_method :sort_column, :sort_direction, :yesno, :state
  
  
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

    def state(x)
      
      col_val = ""
      case x.to_s
        when "0"
          col_val = 'National'
        when "1"
          col_val = 'Alabama'
        when "2"
          col_val = 'Alaska'
        when "3"
          col_val = 'Arizona'
        when "4"
          col_val = 'Arkansas'
        when "5"
          col_val = 'California'
        when "6"
          col_val = 'Colorado'
        when "7"
          col_val = 'Connecticut'
        when "8"
          col_val = 'Delaware'
        when "9"
          col_val = 'DC'
        when "10"
          col_val = 'Florida'
        when "11"
          col_val = 'Georgia'
        when "12"
          col_val = 'Hawaii'
        when "13"
          col_val = 'Idaho'
        when "14"
          col_val = 'Illinois'
        when "15"
          col_val = 'Indiana'
        when "16"
          col_val = 'Iowa'
        when "17"
          col_val = 'Kansas'
        when "18"
          col_val = 'Kentucky'
        when "19"
          col_val = 'Louisiana'
        when "20"
          col_val = 'Maine'
        when "21"
          col_val = 'Maryland'
        when "22"
          col_val = 'Massachusetts'
        when "23"
          col_val = 'Michigan'
        when "24"
          col_val = 'Minnesota'
        when "25"
          col_val = 'Mississippi'
        when "26"
          col_val = 'Missouri'
        when "27"
          col_val = 'Montana'
        when "28"
          col_val = 'Nebraska'
        when "29"
          col_val = 'Nevada'
        when "30"
          col_val = 'New Hampshire'
        when "31"
          col_val = 'New Jersey'
        when "32"
          col_val = 'New Mexico'
        when "33"
          col_val = 'New York'
        when "34"
          col_val = 'North Carolina'
        when "35"
          col_val = 'North Dakota'
        when "36"
          col_val = 'Ohio'
        when "37"
          col_val = 'Oklahoma'
        when "38"
          col_val = 'Oregon'
        when "39"
          col_val = 'Pennsylvania'
        when "40"
          col_val = 'Rhode Island'
        when "41"
          col_val = 'South Carolina'
        when "42"
          col_val = 'South Dakota'
        when "43"
          col_val = 'Tennessee'
        when "44"
          col_val = 'Texas'
        when "45"
          col_val = 'Utah'
        when "46"
          col_val = 'Vermont'
        when "47"
          col_val = 'Virginia'
        when "48"
          col_val = 'Washington'
        when "49"
          col_val = 'West Virginia'
        when "50"
          col_val = 'Wisconsin'
        when "51"
          col_val = 'Wyoming'
        else
          col_val = ''
      end

      # x = col_val
      return col_val      
    end

  
end


    # 0  National
    # 1  Alabama
    # 2  Alaska 
    # 3  Arizona
    # 4  Arkansas
    # 5  California
    # 6  Colorado 
    # 7  Connecticut
    # 8  Delaware   
    # 9  DC
    # 10 Florida  
    # 11 Georgia  
    # 12 Hawaii 
    # 13 Idaho  
    # 14 Illinois
    # 15 Indiana 
    # 16 Iowa   
    # 17 Kansas   
    # 18 Kentucky
    # 19 Louisiana 
    # 20 Maine 
    # 21 Maryland 
    # 22 Massachusetts
    # 23 Michigan 
    # 24 Minnesota
    # 25 Mississippi 
    # 26 Missouri   
    # 27 Montana  
    # 28 Nebraska   
    # 29 Nevada 
    # 30 New Hampshire 
    # 31 New Jersey   
    # 32 New Mexico   
    # 33 New York   
    # 34 North Carolina 
    # 35 North Dakota   
    # 36 Ohio   
    # 37 Oklahoma 
    # 38 Oregon 
    # 39 Pennsylvania
    # 40 Rhode Island
    # 41 South Carolina
    # 42 South Dakota 
    # 43 Tennessee  
    # 44 Texas  
    # 45 Utah   
    # 46 Vermont 
    # 47 Virginia
    # 48 Washington
    # 49 West Virginia
    # 50 Wisconsin 
    # 51 Wyoming   
