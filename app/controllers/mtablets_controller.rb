class MtabletsController < ApplicationController

  respond_to :html, :js, :json  
  
  require 'csv'

  # require 'will_paginate/array'
  
  layout 'mtablet'
  
  helper_method :sort_column, :sort_direction
  
  
  @@mtablets = nil
  @@delete = false
  @@s = ''
  
  # @@tablet_test = 'tablet_test'
  
  def index
    
    # if params[:id_export] == '1'
#       
        # @tablets = Mtablet.where(:id => '70')
#           
        # respond_to do |format|
#           
          # # if format == format.csv
            # # @tablets = Mtablet.where(:id => '70')
          # # end
#           
          # format.html
          # # format.csv
          # format.js
        # end
    # end    
    
    # @tablets = null
    
    s = 's'
    search_by = ''
    search = ''
    search_by_text = ''
    
    
    if params[:search_by].nil? and params[:export].nil? and @@delete == false
      
      @mtablets = get_mtablets_1
      # @mtablets = Mtablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      @@mtablets = @mtablets
      
    elsif !params[:export].nil? and @@delete == false
      # export = params[:export]
      @mtablets = get_mtablets_2(params[:export])
      #@mtablets = Mtablet.where(params[:export]).paginate(:per_page => 200, :page => params[:page])
    elsif !params[:search_by].nil? and @@delete == false

      # @mtablets = Mtablet.where(:id => '99')
      
      # search_by = params[:search_by].to_s
      # search = params[:search].to_s
      # case search_by
      # when "1"
        # search_by_text = 'id'
      # when "2"
        # search_by_text = 'col_1'
      # when "3"
        # search_by_text = 'col_2'
      # when "4"
        # search_by_text = 'col_3'
      # when "5"
        # search_by_text = 'col_4'
      # when "6"
        # search_by_text = 'col_5'
      # when "7"
        # search_by_text = 'col_6'
      # when "8"
        # search_by_text = 'col_7'
      # when "9"
        # search_by_text = 'col_8'
      # when "10"
        # search_by_text = 'col_9'
      # when "11"
        # search_by_text = 'col_10'
      # when "12"
        # search_by_text = 'col_11'
      # when "13"
        # search_by_text = 'col_12'
      # when "14"
        # search_by_text = 'col_13'
      # when "15"
        # search_by_text = 'col_14'
      # when "16"
        # search_by_text = 'col_15'
      # when "17"
        # search_by_text = 'col_16'
      # when "18"
        # search_by_text = 'col_17'
      # when "19"
        # search_by_text = 'col_18'
      # when "20"
        # search_by_text = 'col_19'
      # when "21"
        # search_by_text = 'col_20'
      # else
        # #
      # end
      # if search_by_text == 'id'
        # s = "id=" + search
      # else
        # s = search_by_text + " LIKE '" + search + "'"
      # end
      # @@s = s
      # @mtablets = Mtablet.search_by_sql(s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])

      # search_by = params[:search_by].to_s
      # search = params[:search].to_s


      @mtablets = get_mtablets_3(params[:search_by].to_s, params[:search].to_s)
      
    elsif @@delete == true
      
      # if @@s != ''
        # @mtablets = Mtablet.search_by_sql(@@s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      # else
        # @mtablets = Mtablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      # end
      
      @mtablets = get_mtablets_4
      
    else
      #
    end    
    
    @@delete = false
    
    @@mtablets = @mtablets

    # @mtablet_test = @@mtablet_test

    respond_to do |format|
      format.html
      format.csv
      format.js
    end

        
  end


  def get_mtablets_1
    
      @mtablets = Mtablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      return @mtablets
      
  end


  def get_mtablets_2(export_params)
    
      @mtablets = Mtablet.where(export_params).paginate(:per_page => 200, :page => params[:page])
      return @mtablets
      
  end


  def get_mtablets_3(search_by, search)

      # search_by = params[:search_by].to_s
      # search = params[:search].to_s
      
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
      else
        #
      end
      
      if search_by_text == 'id'
        s = "id=" + search
      else
        s = search_by_text + " LIKE '" + search + "'"
      end
      
      @@s = s

      @mtablets = Mtablet.search_by_sql(s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])

      return @mtablets
      
  end


  def get_mtablets_4

      if @@s != ''
        res = Mtablet.search_by_sql(@@s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      else
        res = Mtablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      end

      return @mtablets = res
  end
  
  

  def dbdelete
      Mtablet.dbdelete
      Mtablet.dbclear
      redirect_to action: "index"
      # render text: 'dbdelete'
  end

  
  def dbclear
      Mtablet.dbclear
      redirect_to action: "index"
      # render text: 'dbclear'
  end



  def exec_sql
    
    # a_mtablets = Array.new
    # sql = "SELECT * FROM tab2lets"
    
    ActiveRecord::Base.establish_connection
    @results = ActiveRecord::Base.connection.execute(params[:sql])

    # @mtablets = Mtablet.find_by_sql("SELECT * FROM tab2lets WHERE id=1")

    @results.each do |row|
       mtablet = create_mtablet
       mtablet.col_id = row['id']
       mtablet.col_1 = row['col_1']
       mtablet.col_2 = row['col_2']
       mtablet.col_3 = row['col_3']
       mtablet.col_4 = row['col_4']
       mtablet.col_5 = row['col_5']
       mtablet.col_6 = row['col_6']
       mtablet.col_7 = row['col_7']
       mtablet.col_8 = row['col_8']
       mtablet.col_9 = row['col_9']
       mtablet.col_10 = row['col_10']
       mtablet.col_11 = row['col_11']
       mtablet.col_12 = row['col_12']
       mtablet.col_13 = row['col_13']
       mtablet.col_14 = row['col_14']
       mtablet.col_15 = row['col_15']
       mtablet.col_16 = row['col_16']
       mtablet.col_17 = row['col_17']
       mtablet.col_18 = row['col_18']
       mtablet.col_19 = row['col_19']
       mtablet.col_20 = row['col_20']
       mtablet.col_21 = row['col_21']
       mtablet.col_22 = row['col_22']
       mtablet.col_23 = row['col_23']
       mtablet.col_24 = row['col_24']
       mtablet.col_25 = row['col_25']
       mtablet.col_26 = row['col_26']
       mtablet.col_27 = row['col_27']
       mtablet.col_28 = row['col_28']
       mtablet.col_29 = row['col_29']
       mtablet.col_30 = row['col_30']
       mtablet.col_31 = row['col_31']
       mtablet.col_32 = row['col_32']
       mtablet.col_33 = row['col_33']
       mtablet.col_34 = row['col_34']
       mtablet.col_35 = row['col_35']
       mtablet.col_36 = row['col_36']
       mtablet.col_37 = row['col_37']
       mtablet.col_38 = row['col_38']
       mtablet.col_39 = row['col_39']
       mtablet.col_40 = row['col_40']
       mtablet.col_41 = row['col_41']
       mtablet.col_42 = row['col_42']
       mtablet.col_43 = row['col_43']
       mtablet.col_44 = row['col_44']
       mtablet.col_45 = row['col_45']
       mtablet.col_46 = row['col_46']
       mtablet.col_47 = row['col_47']
       mtablet.col_48 = row['col_48']
       mtablet.col_49 = row['col_49']
       mtablet.col_50 = row['col_50']
       
       mtablet.save
    end    
    
    @mtablets = Mtablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
    
    if !@mtablets.nil?
      redirect_to action: "index"
    else
      render text: 'error'
    end
    
  end



  def export
    
    # @mtablets = Mtablet.where(params[:export])

    @mtablets = @@mtablets
  
    respond_to do |format|
      format.html
      format.csv
       #format.js
    end
    
  end

  
  
  def new
    
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

    file_dir = 'public/mtablet/' + file_name

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
        INSERT INTO mtablets (#{sql_keys.join(', ')}, created_at, updated_at)
        VALUES (#{sql_vals.join(', ')}, '#{created_at}', '#{created_at}')
      "
 
      res = ActiveRecord::Base.connection.execute(sql)
    end
    
    redirect_to action: "index"
    
    
  end


  def show
    @mtablet = Mtablet.find(params[:id])    
  end

  
  def create
  end

  
  def edit
    @mtablet = Mtablet.find_by_id(params[:id])    
  end

  
  def update
    
    @mtablet = Mtablet.find(params[:id])
    
    if @mtablet.update_attributes(params[:mtablet])
      # redirect_to(:action => 'show', :saved_id => @archive.id)
      
      redirect_to(:action => 'show', :saved_id => @mtablet.id)
      
    else
      # @subject_count = Subject.count
      render text: 'update failed'
    end    
  end


  def delete
    # @contact = Contact.find(params[:id])
  end


  def destroy
     
    mtablet = Mtablet.find(params[:id])
    if mtablet.delete
      @@delete = true
      redirect_to(mtablets_index_path)
    else
      render text: 'delete failed'
    end
     
  end

  
  
  private

    def mtablets_params
      params.require(:mtablet).permit(
                                    :col_id,
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
      Mtablet.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
    def create_mtablet
        mtablet = Mtablet.create(
                                :col_id => "",
                                :col_1 => "",
                                :col_2 => "",
                                :col_3 => "",
                                :col_4 => "",
                                :col_5 => "",
                                :col_6 => "",
                                :col_7 => "",
                                :col_8 => "",
                                :col_9 => "",
                                :col_10 => "",
                                :col_11 => "",
                                :col_12 => "",
                                :col_13 => "",
                                :col_14 => "",
                                :col_15 => "",
                                :col_17 => "",
                                :col_17 => "",
                                :col_18 => "",
                                :col_19 => "",
                                :col_20 => "",
                                :col_21 => "",
                                :col_22 => "",
                                :col_23 => "",
                                :col_24 => "",
                                :col_25 => "",                              
                                :col_26 => "",                              
                                :col_27 => "",                              
                                :col_28 => "",                              
                                :col_29 => "",                              
                                :col_30 => "",                              
                                :col_31 => "",                              
                                :col_32 => "",                              
                                :col_33 => "",                              
                                :col_34 => "",                              
                                :col_35 => "",                              
                                :col_36 => "",                              
                                :col_37 => "",                              
                                :col_38 => "",                              
                                :col_39 => "",                              
                                :col_40 => false,                              
                                :col_41 => false,                              
                                :col_42 => false,                              
                                :col_43 => false,                              
                                :col_44 => false,                              
                                :col_45 => false,                              
                                :col_46 => false,                              
                                :col_47 => false,                              
                                :col_48 => false,                              
                                :col_49 => false,                              
                                :col_50 => false                              
                              )
      
        return mtablet
    end



end
