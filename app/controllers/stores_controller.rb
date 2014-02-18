class StoresController < ApplicationController
  
  # layout 'admin_users'

  require 'csv'

  layout 'store'
  
  helper_method :sort_column, :sort_direction
  
  
  @@stores = nil
  @@delete = false
  @@s = ''
  
  def index
    
    # if params[:id_export] == '1'
#       
        # @stores = Store.where(:id => '70')
#           
        # respond_to do |format|
#           
          # # if format == format.csv
            # # @stores = Store.where(:id => '70')
          # # end
#           
          # format.html
          # # format.csv
          # format.js
        # end
    # end    
    
    # @stores = null
    
    s = 's'
    search_by = ''
    search = ''
    search_by_text = ''
    
    
    if params[:search_by].nil? and params[:export].nil? and @@delete == false
      @stores = Store.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      @@stores = @stores
      
    elsif !params[:export].nil? and @@delete == false
      
      export = params[:export]
      @stores = Store.where(params[:export]).paginate(:per_page => 200, :page => params[:page])
      #@stores = Store.where(:id => export.id)
    elsif !params[:search_by].nil? and @@delete == false

      # @stores = Store.where(:id => '99')
      
      search_by = params[:search_by].to_s
      search = params[:search].to_s
      
      case search_by
      when "1"
        search_by_text = 'id'
      when "2"
        search_by_text = 'name_type'
      when "3"
        search_by_text = 'salutation'
      when "4"
        search_by_text = 'name_first'
      when "5"
        search_by_text = 'name_last'
      when "6"
        search_by_text = 'name_title'
      when "7"
        search_by_text = 'institute'
      when "8"
        search_by_text = 'department'
      when "9"
        search_by_text = 'address_1'
      when "10"
        search_by_text = 'address_2'
      when "11"
        search_by_text = 'city'
      when "12"
        search_by_text = 'state'
      when "13"
        search_by_text = 'zip'
      when "14"
        search_by_text = 'country'
      when "15"
        search_by_text = 'phone'
      when "16"
        search_by_text = 'fax'
      when "17"
        search_by_text = 'phone_direct'
      when "18"
        search_by_text = 'phone_mobile'
      when "19"
        search_by_text = 'email'
      when "20"
        search_by_text = 'website'        
      else
        #
      end
      
      if search_by_text == 'id'
        s = "id=" + search
      else
        s = search_by_text + " LIKE '" + search + "'"
      end
      
      @@s = s
      
      @stores = Store.search_by_sql(s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      
    elsif @@delete == true
      
      if @@s != ''
        @stores = Store.search_by_sql(@@s).order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      else
        @stores = Store.order(sort_column + " " + sort_direction).paginate(:per_page => 200, :page => params[:page])
      end
    else
      #
    end    
    
    @@delete = false
    
    @@stores = @stores

    respond_to do |format|
      format.html
      format.csv
      format.js
    end

        
  end

  def dbdelete
      Store.dbdelete
      redirect_to action: "index"
      # render text: 'dbdelete'
  end
  
  def dbclear
      Store.dbclear
      redirect_to action: "index"
      # render text: 'dbclear'
  end
  
  def export
    
    # render text: 'export'
    
    # @stores = Store.where(params[:export])

    @stores = @@stores
 
  
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
      "name_type",
      "salutation",
      "name_first",
      "name_last",
      "name_title",
      "institute",     
      "department",     
      "address_1",     
      "address_2",     
      "city",     
      "state",     
      "zip",     
      "country",     
      "phone",     
      "fax",     
      "phone_direct",     
      "phone_mobile",     
      "email",     
      "website"     
    ]
 
    ActiveRecord::Base.establish_connection
 
    # send_file "#{Rails.root}/public/downloads/test.htm"    

    file_dir = 'public/store/' + file_name

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
        INSERT INTO stores (#{sql_keys.join(', ')}, created_at, updated_at)
        VALUES (#{sql_vals.join(', ')}, '#{created_at}', '#{created_at}')
      "
 
      res = ActiveRecord::Base.connection.execute(sql)
    end
    
    redirect_to action: "index"
    
    
  end

  def upload

    # @stores = Store.order(:id)
    # respond_to do |format|
      # format.html
      # format.csv { send_data @stores.to_csv }
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

    
    # render text: a_store[0]
    

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

    # a_store = Array.new
    
    # INSERT INTO table_name (column1,column2,column3,...) VALUES (value1,value2,value3,...);    
     
    # sql_insert = "INSERT INTO " + table_name + "(col1) VALUES (" + line + ")"
     
    # File.open("#{Rails.root}/public/downloads/test.txt", "r").each_line do |line|
# 
      # # sql_insert = "INSERT INTO " + table_name + " (col1) VALUES (" + line + ")"
# 
      # sql_insert = "INSERT INTO " + table_name + " (col1) VALUES ('cool test')"
# 
      # ActiveRecord::Base.connection.execute(sql_insert)    
      
      #a_store.push(line)

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
    @store = Store.find(params[:id])    
  end
  
  def create
  end
  
  def edit
    @store = Store.find_by_id(params[:id])    
  end
  
  def update
    
    @store = Store.find(params[:id])
    
    if @store.update_attributes(params[:store])
      # redirect_to(:action => 'show', :saved_id => @archive.id)
      
      redirect_to(:action => 'show', :saved_id => @store.id)
      
    else
      # @subject_count = Subject.count
      render text: 'update failed'
    end    
  end

  def delete
    # @contact = Contact.find(params[:id])
  end

  def destroy
     
    store = Store.find(params[:id])
    if store.delete
      @@delete = true
      redirect_to(stores_index_path)
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

    def stores_params
      params.require(:store).permit(
                                    :created_at, 
                                    :updated_at,
                                    :name_type,
                                    :salutation,
                                    :name_first,
                                    :name_last,
                                    :name_title,
                                    :institute,
                                    :department,
                                    :address_1,
                                    :address_2,
                                    :city,
                                    :state,
                                    :zip,
                                    :country,
                                    :phone,
                                    :fax,
                                    :phone_direct,
                                    :phone_mobile,
                                    :email,
                                    :website
                                    )
          
    end
  
  
    def sort_column
      Store.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
  

  
end
