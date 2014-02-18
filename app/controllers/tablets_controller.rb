class TabletsController < ApplicationController

  respond_to :html, :js, :json  
  
  require 'csv'

  # require 'will_paginate/array'
  
  layout 'tablet'
  
  helper_method :sort_column, :sort_direction
  
  
  @@tablets = nil
  @@delete = false
  @@s = ''
  
  # @@tablet_test = 'tablet_test'
  
  def index
    
    # if params[:id_export] == '1'
#       
        # @tablets = Tablet.where(:id => '70')
#           
        # respond_to do |format|
#           
          # # if format == format.csv
            # # @tablets = Tablet.where(:id => '70')
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
      
      @tables = get_tablets_1
      # @tablets = Tablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      @@tablets = @tablets
      
    elsif !params[:export].nil? and @@delete == false
      # export = params[:export]
      @tablets = get_tablets_2(params[:export])
      #@tablets = Tablet.where(params[:export]).paginate(:per_page => 200, :page => params[:page])
    elsif !params[:search_by].nil? and @@delete == false

      # @tablets = Tablet.where(:id => '99')
      
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
      # @tablets = Tablet.search_by_sql(s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])

      # search_by = params[:search_by].to_s
      # search = params[:search].to_s


      @tablets = get_tablets_3(params[:search_by].to_s, params[:search].to_s)
      
    elsif @@delete == true
      
      # if @@s != ''
        # @tablets = Tablet.search_by_sql(@@s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      # else
        # @tablets = Tablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      # end
      
      @tablets = get_tablets_4
      
    else
      #
    end    
    
    @@delete = false
    
    @@tablets = @tablets

    # @tablet_test = @@tablet_test

    respond_to do |format|
      format.html
      format.csv
      format.js
    end

        
  end


  def get_tablets_1
    
      @tablets = Tablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      return @tablets
      
  end


  def get_tablets_2(export_params)
    
      @tablets = Tablet.where(export_params).paginate(:per_page => 200, :page => params[:page])
      return @tablets
      
  end


  def get_tablets_3(search_by, search)

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

      @tablets = Tablet.search_by_sql(s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])

      return @tablets
      
  end


  def get_tablets_4

      if @@s != ''
        res = Tablet.search_by_sql(@@s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      else
        res = Tablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      end

      return @tablets = res
  end
  
  
  def results_content
    
    render text: 'results_content'
    
    # @test = "Clyde's cool tabs test"
#     
    # respond_to do |format|
      # format.js
    # end    
    
  end


  def dbdelete
      Tablet.dbdelete
      Tablet.dbclear
      redirect_to action: "index"
      # render text: 'dbdelete'
  end

  
  def dbclear
      Tablet.dbclear
      redirect_to action: "index"
      # render text: 'dbclear'
  end

  def remote_test
    # @tablets = Tablet.new
    # sql = params[:sql]
    # ActiveRecord::Base.establish_connection
    # @results = ActiveRecord::Base.connection.execute(sql)
    # @tablets = @results
    # render 'index'
  end


  def remote_form
    
    @tablets = Tablet.new
    
    a_tablets = Array.new
    # a_tablets = Tab1let.find_by_sql(sql)
    a_tablets = Tab1let.find_by_sql(params[:sql])
    
    @tablets = a_tablets

    @tablets = @tablets.paginate(:per_page => 200, :page => params[:page])
    
    if !@tablets.nil?
      
    # respond_to do |format|
      # format.html
      # format.js
    # end
      
      
      render 'index'
    else
      render text: 'error'
    end
    
    
  end



  def exec_sql
    
    # a_tablets = Array.new
    # sql = "SELECT * FROM tab2lets"
    
    ActiveRecord::Base.establish_connection
    @results = ActiveRecord::Base.connection.execute(params[:sql])

    # @tablets = Tablet.find_by_sql("SELECT * FROM tab2lets WHERE id=1")

    @results.each do |row|
       tablet = create_tablet
       tablet.col_id = row['id']
       tablet.col_1 = row['col_1']
       tablet.col_2 = row['col_2']
       tablet.col_3 = row['col_3']
       tablet.col_4 = row['col_4']
       tablet.col_5 = row['col_5']
       tablet.col_6 = row['col_6']
       tablet.col_7 = row['col_7']
       tablet.col_8 = row['col_8']
       tablet.col_9 = row['col_9']
       tablet.col_10 = row['col_10']
       tablet.col_11 = row['col_11']
       tablet.col_12 = row['col_12']
       tablet.col_13 = row['col_13']
       tablet.col_14 = row['col_14']
       tablet.col_15 = row['col_15']
       tablet.col_16 = row['col_16']
       tablet.col_17 = row['col_17']
       tablet.col_18 = row['col_18']
       tablet.col_19 = row['col_19']
       tablet.col_20 = row['col_20']
       tablet.col_21 = row['col_21']
       tablet.col_22 = row['col_22']
       tablet.col_23 = row['col_23']
       tablet.col_24 = row['col_24']
       tablet.col_25 = row['col_25']
       
       tablet.save
    end    
    
    @tablets = Tablet.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
    
    if !@tablets.nil?
      # render 'index'
      redirect_to action: "index"
      
    else
      render text: 'error'
    end

    
  end

  def export
    
    # render text: 'export'
    
    # @tablets = Tablet.where(params[:export])

    @tablets = @@tablets
 
  
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
      "col_20"
    ]
 
    ActiveRecord::Base.establish_connection
 
    # send_file "#{Rails.root}/public/downloads/test.htm"    

    file_dir = 'public/tablet/' + file_name

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
        INSERT INTO tablets (#{sql_keys.join(', ')}, created_at, updated_at)
        VALUES (#{sql_vals.join(', ')}, '#{created_at}', '#{created_at}')
      "
 
      res = ActiveRecord::Base.connection.execute(sql)
    end
    
    redirect_to action: "index"
    
    
  end

  def upload

    # @tablets = Tablet.order(:id)
    # respond_to do |format|
      # format.html
      # format.csv { send_data @tablets.to_csv }
      # format.xls # { send_data @products.to_csv(col_sep: "\t") }
    # end

    # name_first                  First Name  
    # name_last                   Last Name  
    # name_title                  Title
    # institute                   INSTITUTE
    # department                  Department 
    # address_1                   Mailing Address Line 1 
    # address_2                   Mailing Address Line 2 
    # city                        Mailing City 
    # state_providence            Mailing State/Provence
    # zip                         Mailing Zip/Postal Code
    # country                     Mailing Country
    # phone                       Main Phone
    # fax                         Fax
    # phone_direct                Phone Direct 
    # phone_mobile                Mobile Phone  
    # email_website               Email Website

    
    # render text: a_tablet[0]
    

    # table_name = params[:table_name]

    # render text: table_name
    
    # nextval('landins_id_seq'::regclass)

    # sql = "CREATE TABLE " + table_name + " (id int, col1 character varying(100), PRIMARY KEY(id))"

    # CREATE TABLE archives (
        # id integer NOT NULL,
        # article_id integer,
        # name_url character varying(100),
        # key_words text,
        # date_article date,
        # created_at timestamp without time zone,
        # updated_at timestamp without time zone,
    # );

    # sql = "CREATE TABLE " + table_name + " (id SERIAL PRIMARY KEY, col1 character varying(100), created_at timestamp without time zone, updated_at timestamp without time zone)"
    # ActiveRecord::Base.connection.execute(sql)    
    
    
    # MyModel.table_name = "my_table"
    # records = MyModel.all    

    # a_tablet = Array.new
    
    # INSERT INTO table_name (column1,column2,column3,...) VALUES (value1,value2,value3,...);    
     
    # sql_insert = "INSERT INTO " + table_name + "(col1) VALUES (" + line + ")"
     
    # File.open("#{Rails.root}/public/downloads/test.txt", "r").each_line do |line|
# 
      # # sql_insert = "INSERT INTO " + table_name + " (col1) VALUES (" + line + ")"
# 
      # sql_insert = "INSERT INTO " + table_name + " (col1) VALUES ('cool test')"
# 
      # ActiveRecord::Base.connection.execute(sql_insert)    
      
      #a_tablet.push(line)

    # end
    
    
    


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
    
    # render 'create'
    
    
  end

  def show
    #render 'exec_sql'
    @tablet = Tablet.find(params[:id])    
  end
  
  def create
  end
  
  def edit
    @tablet = Tablet.find_by_id(params[:id])    
  end
  
  def update
    
    @tablet = Tablet.find(params[:id])
    
    if @tablet.update_attributes(params[:tablet])
      # redirect_to(:action => 'show', :saved_id => @archive.id)
      
      redirect_to(:action => 'show', :saved_id => @tablet.id)
      
    else
      # @subject_count = Subject.count
      render text: 'update failed'
    end    
  end

  def delete
    # @contact = Contact.find(params[:id])
  end

  def destroy
     
    tablet = Tablet.find(params[:id])
    if tablet.delete
      @@delete = true
      redirect_to(tablets_index_path)
    else
      render text: 'delete failed'
    end
     
  end
  
  
  
  
  
  # def confirm_logged_in
    # unless session[:user_id]
      # flash[:notice] = "Please log in."
      # redirect_to(login_path)
      # return false # halts the before_filter
    # else
      # #redirect_to(:controller => 'admin_users', :action => 'list')
      # return true
    # end
  # end
  
  # def get_message
    # respond_to do |format|
      # format.html
      # format.js      
    # end    
  # end

  
  
  private

    def tablets_params
      params.require(:tablet).permit(
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
                                    :created_at,
                                    :updated_at  
                                    )
          
    end
  
  
    def sort_column
      Tablet.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
    def create_tablet
        tablet = Tablet.create(
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
                                :col_25 => ""                              
                              )
      
        return tablet
    end


  
end


  # adapter: postgresql
  # encoding: unicode
  # database: dbWebLearn
  # pool: 5
  # username: root
  # password: sa
  # host: localhost
  # port: 5434
    
    # @connection = ActiveRecord::Base.establish_connection(
                # :adapter => "postgresql",
                # :encoding => "unicode",
                # :host => "localhost",
                # :database => "dbWebLearn",
                # :pool => "5",
                # :username => "root",
                # :password => "sa",
                # :port => "5434"
    # )
