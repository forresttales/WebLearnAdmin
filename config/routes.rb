Weblearnadmin::Application.routes.draw do
   

  root :to => "admin_users#home"
  
  # match "/" => "static_pages#index", via: 'get'
  

  resources :password_resets do
    collection do
      post :create_reset
    end
  end
  resources :password_resets

  # get "images/index"

  get "test/test_scroll"

  match '/item_registers_index', to: 'item_registers#index', via: 'get'
  match '/item_registers/new', to: 'item_registers#new', via: 'get'
  match "/item_registers/:id/edit" => "item_registers#edit", via: 'post'
  match "/item_registers/:id" => "item_registers#update", via: 'post'
  get "item_registers/show"
  get "item_registers/view"
  resources :item_registers

  match '/hit_counts_index', to: 'hit_counts#index', via: 'get'
  resources :hit_counts


  match '/admin_reg_communs_index', to: 'admin_reg_communs#index', via: 'get'
  match '/admin_reg_communs/new', to: 'admin_reg_communs#new', via: 'get'
  match "/admin_reg_communs/:id/edit" => "admin_reg_communs#edit", via: 'post'
  match "/admin_reg_communs/:id" => "admin_reg_communs#update", via: 'post'
  # match "/admin_reg_communs/:id/edit" => "admin_reg_communs#edit", via: 'post'
  resources :admin_reg_communs


  resources :admin_landings
  
  
  # resources :contacts
  resources :students
  resources :teachers
  resources :institutes
  resources :publishers
  resources :static_pages
  resources :share_files  
  resources :uploads
  
  
  
  
  match '/reg_event_itins_index', to: 'reg_event_itins#index', via: 'get'
  match '/reg_event_itins/new', to: 'reg_event_itins#new', via: 'get'
  match "/reg_event_itins/:id/edit" => "reg_event_itins#edit", via: 'post'
  match "/reg_event_itins/dbdelete" => "reg_event_itins#dbdelete", via: 'post'
  match "/reg_event_itins/dbclear" => "reg_event_itins#dbclear", via: 'post'
  match "/reg_event_itins/:id" => "reg_event_itins#update", via: 'post'
  
  resources :reg_event_itins do
    member do
      get 'export'
    end
  end

  resources :reg_event_itins





  get "swings/index"

  get "stores/index"
  get "stores/show"
  match '/stores/upload', to: 'stores#upload', via: 'post'
  match '/stores/new', to: 'stores#new', via: 'get'
  match "/stores/:id/edit" => "stores#edit", via: 'post'

  resources :stores do
    collection { post :import }
  end

  match "/stores/:id" => "stores#update", via: 'get'


  resources :stores do
    member do
      get 'export'
    end
  end

  resources :stores do
    collection do
      post :dbclear
    end
  end

  resources :stores do
    collection do
      post :dbdelete
    end
  end

  # match "/stores/dbclear" => "stores#dbclear", via: :all

  resources :stores







  get "tablets/index"
  get "tablets/show"
  match '/tablets/upload', to: 'tablets#upload', via: 'post'
  match '/tablets/new', to: 'tablets#new', via: 'get'
  match "/tablets/:id/edit" => "tablets#edit", via: 'post'
  match "/tablets/remote_test" => "tablets#remote_test", via: 'get'

  resources :tablets do
    collection { post :import }
  end

  # match '/exec_sql', to: 'tablets#exec_sql', via: 'post'

  resources :tablets do
    collection { post :exec_sql }
  end

  resources :tablets do
    collection { post :remote_test }
  end

  resources :tablets do
    collection { post :remote_form }
  end

  # resources :tablets do
    # collection do
      # post :exec_sql
    # end
  # end


  match "/tablets/:id" => "tablets#update", via: 'get'


  resources :tablets do
    member do
      get 'export'
    end
  end

  resources :tablets do
    collection do
      post :dbclear
    end
  end

  resources :tablets do
    collection do
      post :dbdelete
    end
  end


  # resources :tablets do
    # get "results_content", :on => :member
  # end

  resources :tablets do
    collection do
      get :results_content
    end
  end


  # match "/tablets/dbclear" => "tablets#dbclear", via: :all

  resources :tablets









  get "tab1lets/index"
  get "tab1lets/show"
  match '/tab1lets/upload', to: 'tab1lets#upload', via: 'post'
  match '/tab1lets/new', to: 'tab1lets#new', via: 'get'
  match "/tab1lets/:id/edit" => "tab1lets#edit", via: 'post'

  resources :tab1lets do
    collection { post :import }
  end

  match "/tab1lets/:id" => "tab1lets#update", via: 'get'


  resources :tab1lets do
    member do
      get 'export'
    end
  end

  resources :tab1lets do
    collection do
      post :dbclear
    end
  end

  resources :tab1lets do
    collection do
      post :dbdelete
    end
  end

  # match "/tab1lets/dbclear" => "tab1lets#dbclear", via: :all

  resources :tab1lets






  get "tab2lets/index"
  get "tab2lets/show"
  match '/tab2lets/upload', to: 'tab2lets#upload', via: 'post'
  match '/tab2lets/new', to: 'tab2lets#new', via: 'get'
  match "/tab2lets/:id/edit" => "tab2lets#edit", via: 'post'

  resources :tab2lets do
    collection { post :import }
  end

  match "/tab2lets/:id" => "tab2lets#update", via: 'get'


  resources :tab2lets do
    member do
      get 'export'
    end
  end

  resources :tab2lets do
    collection do
      post :dbclear
    end
  end

  resources :tab2lets do
    collection do
      post :dbdelete
    end
  end

  # match "/tab2lets/dbclear" => "tab2lets#dbclear", via: :all

  resources :tab2lets





  get "tab3lets/index"
  get "tab3lets/show"
  match '/tab3lets/upload', to: 'tab3lets#upload', via: 'post'
  match '/tab3lets/new', to: 'tab3lets#new', via: 'get'
  match "/tab3lets/:id/edit" => "tab3lets#edit", via: 'post'

  resources :tab3lets do
    collection { post :import }
  end

  match "/tab3lets/:id" => "tab3lets#update", via: 'get'


  resources :tab3lets do
    member do
      get 'export'
    end
  end

  resources :tab3lets do
    collection do
      post :dbclear
    end
  end

  resources :tab3lets do
    collection do
      post :dbdelete
    end
  end

  # match "/tab3lets/dbclear" => "tab3lets#dbclear", via: :all

  resources :tab3lets






  get "tab4lets/index"
  get "tab4lets/show"
  match '/tab4lets/upload', to: 'tab4lets#upload', via: 'post'
  match '/tab4lets/new', to: 'tab4lets#new', via: 'get'
  match "/tab4lets/:id/edit" => "tab4lets#edit", via: 'post'

  resources :tab4lets do
    collection { post :import }
  end

  match "/tab4lets/:id" => "tab4lets#update", via: 'get'


  resources :tab4lets do
    member do
      get 'export'
    end
  end

  resources :tab4lets do
    collection do
      post :dbclear
    end
  end

  resources :tab4lets do
    collection do
      post :dbdelete
    end
  end

  # match "/tab4lets/dbclear" => "tab4lets#dbclear", via: :all

  resources :tab4lets






  #*********************************************************************
  # mtables
  
  # get "mtablets/index"
  # get "mtablets/show"
  # match '/mtablets/new', to: 'mtablets#new', via: 'get'
  # match "/mtablets/:id/edit" => "mtablets#edit", via: 'post'
  # match "/mtablets/:id" => "mtablets#update", via: 'get'
  # match '/mtablets/upload', to: 'mtablets#upload', via: 'post'
  
  get "mtablets/index"
  get "mtablets/update_show"
  match "/mtablets/show/:id" => "mtablets#show", via: 'get'
  match '/mtablets/new', to: 'mtablets#new', via: 'get'
  match "/mtablets/:id/edit" => "mtablets#edit", via: 'post'
  match '/mtablets/upload', to: 'mtablets#upload', via: 'post'
  
  resources :mtablets do
    collection { post :import }
  end

  resources :mtablets do
    member do
      get 'export'
    end
  end

  resources :mtablets do
    collection { post :exec_sql }
  end

  resources :mtablets do
    collection do
      post :dbclear
    end
  end

  resources :mtablets do
    collection do
      post :dbdelete
    end
  end

  match "/mtablets/:id" => "mtablets#update", via: 'post'

  resources :mtablets



  # resources :mtab1lets do
    # member do
      # get 'list'
    # end
  # end

  get "mtab1lets/index"
  # resources :mtab1lets do
    # member do
      # get 'list'
    # end
  # end

  # resources :mtab1lets do
    # collection { get :list }
  # end
  
  # get "mtab1lets/update_show"
  match "/mtab1lets/show/:id" => "mtab1lets#show", via: 'get'
  # get "mtab1lets/list"  
  # match '/mtab1lets/list' => 'mtab1lets#list', :constraints => { :only_ajax => true }, via: 'get'  
  match '/mtab1lets/list' => 'mtab1lets#list', via: 'get'  
  
  match '/mtab1lets/new', to: 'mtab1lets#new', via: 'get'
  match "/mtab1lets/:id/edit" => "mtab1lets#edit", via: 'post'
  match '/mtab1lets/upload', to: 'mtab1lets#upload', via: 'post'
  
  resources :mtab1lets do
    collection { post :import }
  end

  resources :mtab1lets do
    member do
      get 'export'
    end
  end

  resources :mtab1lets do
    collection { post :exec_sql }
  end

  resources :mtab1lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab1lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab1lets/:id" => "mtab1lets#update", via: 'post'

  resources :mtab1lets




  get "mtab2lets/index"
  get "mtab2lets/update_show"
  match "/mtab2lets/show/:id" => "mtab2lets#show", via: 'get'
  match '/mtab2lets/new', to: 'mtab2lets#new', via: 'get'
  match "/mtab2lets/:id/edit" => "mtab2lets#edit", via: 'post'
  match '/mtab2lets/upload', to: 'mtab2lets#upload', via: 'post'
  
  resources :mtab2lets do
    collection { post :import }
  end

  resources :mtab2lets do
    member do
      get 'export'
    end
  end

  resources :mtab2lets do
    collection { post :exec_sql }
  end

  resources :mtab2lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab2lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab2lets/:id" => "mtab2lets#update", via: 'post'

  resources :mtab2lets



  get "mtab3lets/index"
  get "mtab3lets/update_show"
  match "/mtab3lets/show/:id" => "mtab3lets#show", via: 'get'
  match '/mtab3lets/new', to: 'mtab3lets#new', via: 'get'
  match "/mtab3lets/:id/edit" => "mtab3lets#edit", via: 'post'
  match '/mtab3lets/upload', to: 'mtab3lets#upload', via: 'post'
  
  resources :mtab3lets do
    collection { post :import }
  end

  resources :mtab3lets do
    member do
      get 'export'
    end
  end

  resources :mtab3lets do
    collection { post :exec_sql }
  end

  resources :mtab3lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab3lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab3lets/:id" => "mtab3lets#update", via: 'post'

  resources :mtab3lets




  get "mtab4lets/index"
  get "mtab4lets/update_show"
  match "/mtab4lets/show/:id" => "mtab4lets#show", via: 'get'
  match '/mtab4lets/new', to: 'mtab4lets#new', via: 'get'
  match "/mtab4lets/:id/edit" => "mtab4lets#edit", via: 'post'
  match '/mtab4lets/upload', to: 'mtab4lets#upload', via: 'post'
  
  resources :mtab4lets do
    collection { post :import }
  end

  resources :mtab4lets do
    member do
      get 'export'
    end
  end

  resources :mtab4lets do
    collection { post :exec_sql }
  end

  resources :mtab4lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab4lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab4lets/:id" => "mtab4lets#update", via: 'post'

  resources :mtab4lets



  get "mtab5lets/index"
  get "mtab5lets/update_show"
  match "/mtab5lets/show/:id" => "mtab5lets#show", via: 'get'
  match '/mtab5lets/new', to: 'mtab5lets#new', via: 'get'
  match "/mtab5lets/:id/edit" => "mtab5lets#edit", via: 'post'
  match '/mtab5lets/upload', to: 'mtab5lets#upload', via: 'post'
  
  resources :mtab5lets do
    collection { post :import }
  end

  resources :mtab5lets do
    member do
      get 'export'
    end
  end

  resources :mtab5lets do
    collection { post :exec_sql }
  end

  resources :mtab5lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab5lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab5lets/:id" => "mtab5lets#update", via: 'post'

  resources :mtab5lets



  get "mtab6lets/index"
  get "mtab6lets/update_show"
  match "/mtab6lets/show/:id" => "mtab6lets#show", via: 'get'
  match '/mtab6lets/new', to: 'mtab6lets#new', via: 'get'
  match "/mtab6lets/:id/edit" => "mtab6lets#edit", via: 'post'
  match '/mtab6lets/upload', to: 'mtab6lets#upload', via: 'post'
  
  resources :mtab6lets do
    collection { post :import }
  end

  resources :mtab6lets do
    member do
      get 'export'
    end
  end

  resources :mtab6lets do
    collection { post :exec_sql }
  end

  resources :mtab6lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab6lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab6lets/:id" => "mtab6lets#update", via: 'post'

  resources :mtab6lets



  get "mtab7lets/index"
  get "mtab7lets/update_show"
  match "/mtab7lets/show/:id" => "mtab7lets#show", via: 'get'
  match '/mtab7lets/new', to: 'mtab7lets#new', via: 'get'
  match "/mtab7lets/:id/edit" => "mtab7lets#edit", via: 'post'
  match '/mtab7lets/upload', to: 'mtab7lets#upload', via: 'post'
  
  resources :mtab7lets do
    collection { post :import }
  end

  resources :mtab7lets do
    member do
      get 'export'
    end
  end

  resources :mtab7lets do
    collection { post :exec_sql }
  end

  resources :mtab7lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab7lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab7lets/:id" => "mtab7lets#update", via: 'post'

  resources :mtab7lets



  get "mtab8lets/index"
  get "mtab8lets/update_show"
  match "/mtab8lets/show/:id" => "mtab8lets#show", via: 'get'
  match '/mtab8lets/new', to: 'mtab8lets#new', via: 'get'
  match "/mtab8lets/:id/edit" => "mtab8lets#edit", via: 'post'
  match '/mtab8lets/upload', to: 'mtab8lets#upload', via: 'post'
  
  resources :mtab8lets do
    collection { post :import }
  end

  resources :mtab8lets do
    member do
      get 'export'
    end
  end

  resources :mtab8lets do
    collection { post :exec_sql }
  end

  resources :mtab8lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab8lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab8lets/:id" => "mtab8lets#update", via: 'post'

  resources :mtab8lets








  get "admin_user_profiles/index"
  get "admin_user_profiles/show"
  match '/admin_user_profiles/new', to: 'admin_user_profiles#new', via: 'get'
  match "/admin_user_profiles/:id/edit" => "admin_user_profiles#edit", via: 'post'
  match "/admin_user_profiles/:id" => "admin_user_profiles#update", via: 'get'

  resources :admin_user_profiles



  get "admin_user_images/index"
  get "admin_user_images/show"
  match '/admin_user_images/upload', to: 'admin_user_images#upload', via: 'post'
  match '/admin_user_images/new', to: 'admin_user_images#new', via: 'get'
  match "/admin_user_images/:id/edit" => "admin_user_images#edit", via: 'post'
  match "/admin_user_images/:id" => "admin_user_images#update", via: 'get'

  resources :admin_user_images do
    collection { post :set_primary }
  end

  resources :admin_user_images
















  resources :admin_users do
    collection do
      post :dbclear
    end
  end

  resources :admin_users do
    collection do
      post :dbdelete
    end
  end

  match '/admin_users_index', to: 'admin_users#index', via: 'get'  
  match '/admin_users_new', to: 'admin_users#new', via: 'get'  
  # match "/admin_users/:id" => "admin_users#show", via: 'post'
  match "/admin_users/:id/edit" => "admin_users#edit", via: 'post'
  match "/admin_users/:id" => "admin_users#update", via: 'post'

  resources :admin_users





  match '/admin_reg_events_index', to: 'admin_reg_events#index', via: 'get'
  match '/admin_reg_events/new', to: 'admin_reg_events#new', via: 'get'
  match "/admin_reg_events/:id/edit" => "admin_reg_events#edit", via: 'post'
  match "/admin_reg_events/:id" => "admin_reg_events#update", via: 'post'
  resources :admin_reg_events do
    member do
      get 'export'
    end
  end
  resources :admin_reg_events do
    collection do
      post :dbclear
      post :dbdelete      
    end
  end
  resources :admin_reg_events
  get "admin_reg_events/show"
  get "admin_reg_events/view"
  get "admin_reg_events/get_message"





  # get "admin_reg_event_conferences/index"
  match '/admin_reg_event_conferences_index', to: 'admin_reg_event_conferences#index', via: 'get'
  match '/admin_reg_event_conferences/new', to: 'admin_reg_event_conferences#new', via: 'get'
  match "/admin_reg_event_conferences/:id/edit" => "admin_reg_event_conferences#edit", via: 'post'
  match "/admin_reg_event_conferences/:id" => "admin_reg_event_conferences#update", via: 'post'
  
  resources :admin_reg_event_conferences do
    member do
      get 'export'
    end
  end

  resources :admin_reg_event_conferences do
    collection do
      post :dbclear
    end
  end

  resources :admin_reg_event_conferences do
    collection do
      post :dbdelete
    end
  end

  # resources :admin_reg_event_conferences do
    # collection do
      # post :destroy_record
    # end
  # end
  
  resources :admin_reg_event_conferences

  get "admin_reg_event_conferences/show"
  get "admin_reg_event_conferences/view"
  # get "admin_reg_event_conferences/get_message"


  match '/admin_reg_letters_index', to: 'admin_reg_letters#index', via: 'get'
  match '/admin_reg_letters/new', to: 'admin_reg_letters#new', via: 'get'
  match "/admin_reg_letters/:id/edit" => "admin_reg_letters#edit", via: 'post'
  match "/admin_reg_letters/:id" => "admin_reg_letters#update", via: 'post'
  
  resources :admin_reg_letters do
    member do
      get 'export'
    end
  end

  resources :admin_reg_letters do
    collection do
      post :dbclear
    end
  end

  resources :admin_reg_letters do
    collection do
      post :dbdelete
    end
  end
  
  resources :admin_reg_letters






  get "admin_contacts/index"
  resources :admin_contacts


  get "admin_seminars/index"
  resources :admin_seminars




  match '/archives_index', to: 'archives#index', via: 'get'
  match '/archives/new', to: 'archives#new', via: 'get'
  # match '/archives_list', to: 'archives#list', via: 'get'
  match "/archives/:id/edit" => "archives#edit", via: 'post'
  match "/archives/:id" => "archives#update", via: 'post'
  resources :archives
  get "archives/show"
  # get "archivess/view"


  match '/eventnews_index', to: 'eventnews#index', via: 'get'
  match '/eventnews/new', to: 'eventnews#new', via: 'get'
  match '/eventnews_list', to: 'eventnews#list', via: 'get'
  match "/eventnews/:id/edit" => "eventnews#edit", via: 'post'
  match "/eventnews/:id" => "eventnews#update", via: 'post'
  resources :eventnews  


  match '/friendly_id_slugs_index', to: 'friendly_id_slugs#index', via: 'get'
  match '/friendly_id_slugs/new', to: 'friendly_id_slugs#new', via: 'get'
  match '/friendly_id_slugs_list', to: 'friendly_id_slugs#list', via: 'get'
  match "/friendly_id_slugs/:id/edit" => "friendly_id_slugs#edit", via: 'post'
  match "/friendly_id_slugs/:id" => "friendly_id_slugs#update", via: 'post'
  resources :friendly_id_slugs


  match '/admin_landings_list', to: 'admin_landings#list', via: 'get'
  match '/admin_landings/new', to: 'admin_landings#new', via: 'get'
  match "/admin_landings/:id/edit" => "admin_landings#edit", via: 'post'
  match "/admin_landings/:id" => "admin_landings#update", via: 'post'

  get "admin_landings/delete", via: :all
  get "admin_landings/show"
  get "admin_landings/view"



  get 'admin_users/show'






  match '/admin_communs_list', to: 'admin_reg_communs#list', via: 'get'
  match '/admin_letters_list', to: 'admin_reg_letters#list', via: 'get'

  # get "admin_reg_letters/edit"
  get "admin_reg_letters/delete", via: :all
  get "admin_reg_letters/show"
  get "admin_reg_letters/view"

  # match "/admin_reg_letters/:id/create" => "admin_reg_letters#show", via: 'get'

  get "admin_reg_letters/get_message"


  # get "admin_reg_letters/edit"
  get "admin_reg_letters/delete", via: :all


  # get "admin_reg_letters/edit"
  get "admin_reg_letters/delete", via: :all
  get "admin_reg_communs/show"
  get "admin_reg_communs/view"

  # match "/admin_reg_letters/:id/create" => "admin_reg_letters#show", via: 'get'

  get "admin_reg_communs/get_message"

  match '/uploads/new', to: 'uploads#new', via: 'get'
  get "uploads/index"
  get "uploads/show"
  match '/uploads/upload', to: 'uploads#upload', via: 'post'
  
  # match '/downloads/show', to: 'downloads#show', via: 'post'
  

  match '/share', to: 'share_files#index', via: 'get'
  match '/share_files/show', to: 'share_files#show', via: 'post'
  
  match '/share_files_list', to: 'share_files#list', via: 'get'



  







  # get "archives/index"
  # #get "archives/new"
  # get "archives/show"
  # get "archives/update"
  # get "archives/create"
  get "test/basic"
  get "static_pages/test"
  get "static_pages/fonts"

  # get "eventnews/index"
  # #get "archives/new"
  # get "eventnews/show"
  # get "eventnews/update"
  # get "eventnews/create"
  
  
  
  #match '/users/testhome', to: 'users#testhome', via: 'get'
     
  # resources :users do
    # member do
      # get :following, :followers
    # end
  # end
  
  resources :sessions, only: [:new, :create, :destroy]
  
  # resources :microposts, only: [:create, :destroy]
  # resources :relationships, only: [:create, :destroy]
  # root to: 'static_pages#home'
  
  
  # match '/signup', to: 'users#new', via: 'get'
  # match '/signin', to: 'sessions#new', via: 'get'
  
  match '/users/new', to: 'users#new', via: 'get'
  match '/sessions/new', to: 'sessions#new', via: 'get'
  
  # match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/signout', to: 'sessions#destroy', via: 'get'
  
  
  # match '/help', to: 'static_pages#help', via: 'get'
  # match '/about', to: 'static_pages#about', via: 'get'
  # match '/contact', to: 'static_pages#contact', via: 'get'

  match "/users/:id/create" => "users#show", via: 'get'

  
  match"/users/:id/admins/index" => "admins#index", via: 'get'


  
  
  get "admins/index"
  get "admins/new"
  get "admins/create"
  get "admins/show"
  get "admins/edit"
  get "admins/update"
  get "admins/destroy"
  get "admin_registers/index"
  get "admin_registers/new"
  get "admin_registers/create"
  get "admin_registers/show"
  get "admin_registers/edit"
  get "admin_registers/update"
  get "admin_registers/destroy"
  get "admin_publishers/index"
  get "admin_publishers/new"
  get "admin_publishers/create"
  get "admin_publishers/show"
  get "admin_publishers/edit"
  get "admin_publishers/update"
  get "admin_publishers/destroy"
  get "admin_institutes/index"
  get "admin_institutes/new"
  get "admin_institutes/create"
  get "admin_institutes/show"
  get "admin_institutes/edit"
  get "admin_institutes/update"
  get "admin_institutes/destroy"
  get "edmatchups/index"
  get "edmatchups/new"
  get "edmatchups/create"
  get "edmatchups/show"
  get "edmatchups/edit"
  get "edmatchups/update"
  get "edmatchups/destroy"
  # get "access_admins/index"
  # get "access_admins/new"
  # get "access_admins/show"
  # get "access_admins/update"
  # get "registers/index"
  # get "registers/new"
  # get "registers/show"
  # get "registers/update"
  get "access_publisher/login"
  get "access_publisher/show"
  get "access_publisher/update"
  get "access_institute/login"
  get "access_institute/show"
  get "access_institute/update"
  get "publishers/index"
  get "publishers/new"
  get "publishers/show"
  get "publishers/update"
  get "user_publishers/index"
  get "user_publishers/new"
  get "user_publishers/show"
  get "user_publishers/update"
  
  
  get "users/index"
  get "users/show"
  
  # get "user_vendors/show"
  # get "vendors/new"
  # get "vendors/show"
  # get "user_surveys/new"
  # get "user_surveys/show"
  # get "surveys/new"
  # get "surveys/show"
  # get "user_institutes/new"
  # get "user_institutes/show"
  # get "institutes/new"
  # get "institutes/show"
  
  # root to: 'users#home'

  # resources :sessions, only: [:new, :create, :destroy]
  # resources :microposts, only: [:create, :destroy]
  # resources :relationships, only: [:create, :destroy]

  # root to: 'static_pages#index'

  match '/signup', to: 'users#new', via: 'get'

  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  match '/', to: 'static_pages#index', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/edmatchup', to: 'static_pages#edmatchup', via: 'get'
  match '/events', to: 'static_pages#events', via: 'get'
  match '/news', to: 'static_pages#news', via: 'get'
  match '/reports', to: 'static_pages#reports', via: 'get'  
  match '/articles', to: 'static_pages#articles', via: 'get'
  match '/advertise', to: 'static_pages#advertise', via: 'get'
  match '/share', to: 'static_pages#share', via: 'get'
  
  #match '/ARTICLES-5-LeiLani-How-Big', to: 'public#ARTICLES-5-LeiLani-How-Big', via: 'get'
  

  resources :access do
    member do
      post 'attempt_login'
    end
  end
# 
  # resources :access_institute do
    # member do
      # post 'attempt_login'
    # end
  # end

  # resources :user_contacts do
    # member do
      # post 'create'
    # end
  # end

  resources :contacts do
    member do
      post 'create'
    end
  end


  resources :institutes do
    member do
      post 'create'
    end
  end
  
  resources :publishers do
    member do
      post 'create'
    end
  end


  # resources :registers do
    # member do
      # post 'create'
    # end
  # end

  resources :users do
    member do
      post 'create'
    end
  end
  
  
  # get "admin_users/index"
  # get "admin_users/delete"
  # get "admin_users/edit"
  # get "admin_users/list"
  # get "admin_users/new"
  # get "admin_users/logout"
#   
  # get "admin_users/view"
  
  
  get "logout/index"
  
  
  # get "contacts/edit"
  # get "contacts/delete", via: :all
  # get "contacts/show"
  # get "contacts/view"

  
  # get "user_contacts/show"
  # get "user_contacts/edit", via: :all
  # get "user_contacts/update", via: :all
  
  get "contacts/show"
  get "contacts/edit", via: :all
  get "contacts/update", via: :all
  
  
  
  



  match '/about', to: 'users#about', via: 'get'
  match '/blogs', to: 'users#blogs', via: 'get'
  match '/home', to: 'users#home', via: 'get'
  match '/news', to: 'users#news', via: 'get'
  match '/services', to: 'users#services', via: 'get'
  #match '/directory', to: 'users#directory', via: 'get'
  match '/edmatchup', to: 'users#edmatchup', via: 'get'



  # match '/admin_users_list', to: 'admin_users#list', via: 'get'  
  match '/admin_institutes_list', to: 'admin_institutes#list', via: 'get'
  match '/admin_publishers_list', to: 'admin_publishers#list', via: 'get'
  match '/admin_teachers_list', to: 'admin_teachers#list', via: 'get'
  match '/admin_students_list', to: 'admin_students#list', via: 'get'


  get "sessions/new"
  
  #match '/sessions/new', to: 'sessions#new', :as => :login, via: ['get', 'post']  


  match '/access/access/login', to: 'access#login', :as => :login, via: ['get', 'post']  
  match '/access/access/attempt_login', to: 'access#attempt_login', :as => 'attempt_login', via: ['post']
  
  
  
  
  
  
  
  match '/access/access_admins/login', to: 'access_admins#login', :as => :login_admin, via: ['get', 'post']  

      
  # match '/user_contacts', to: 'user_contacts#new', via: 'get'
  # match "/user_contacts/:id" => "user_contacts#update", via: 'post'
  match '/contacts', to: 'contacts#new', via: 'get'
  match "/contacts/:id" => "contacts#update", via: 'post'


  match '/publishers', to: 'publishers#index', via: 'get'
  match "/publishers/:id" => "publishers#update", via: 'post'
  match '/publishers/new', to: 'publishers#new', via: 'get'
  match '/publishers/home', to: 'publishers#home', via: 'get'

  match '/institutes', to: 'institutes#index', via: 'get'
  match "/institutes/:id" => "institutes#update", via: 'post'
  match '/institutes/new', to: 'institutes#new', via: 'get'
  match '/institutes/home', to: 'institutes#home', via: 'get'
  
  #match '/user_institutes_create', to: 'user_institutes#create_login', via: 'get'

  match "/students/:id" => "students#update", via: 'post'
  match '/students/new', to: 'students#new', via: 'get'
  match '/students/home', to: 'students#home', via: 'get'
  match '/students/show', to: 'students#show', via: 'get'

  match "/teachers/:id" => "teachers#update", via: 'post'
  match '/teachers/new', to: 'teachers#new', via: 'get'
  match '/teachers/home', to: 'teachers#home', via: 'get'


  #match "/admins_index/:id" => "admins#index", via: 'get'




  match '/access/publisher/login', to: 'access_publisher#login', via: ['get', 'post']  
  match '/access/publisher/attempt_login_publisher', to: 'access_publisher#attempt_login_publisher', :as => 'attempt_login_publisher', via: ['post']


  match '/access/institute/login', to: 'access_institute#login', via: ['get', 'post']  
  match '/access/institute/attempt_login_institute', to: 'access_institute#attempt_login_institute', :as => 'attempt_login_institute', via: ['post']


  # match '/registers/new', to: 'registers#new', via: 'get'
  # match "/registers/:id" => "registers#update", via: 'post'


  #match '/users/new', to: 'users#new', via: 'get'
  match "/users/:id" => "users#update", via: 'post'
  #match "/users/create" => "users#create", via: ['get', 'post']
  
  
  
  #match '/user_institutes_attempt_login', to: 'user_institutes#attempt_login', via: ['get', 'post']

  # get 'access_institute/attempt_login', via: ['post']
  # match '/tasks/:id/finish', :to => 'tasks#finish', :as => 'finish_task'


  match '/demostyle', to: 'users#styledemo', via: 'get'
  match '/democolumns3', to: 'users#columns3', via: 'get'
  match '/demofullwidth', to: 'users#fullwidth', via: 'get'
  match '/demogallery', to: 'users#gallery', via: 'get'
  match '/demoportfolio', to: 'users#portfolio', via: 'get'

  match '/edmatchups', to: 'edmatchups#index', via: 'get'


  match '/home_1', to: 'users#home_1', via: 'get'
  match '/about_1', to: 'users#about_1', via: 'get'
  match '/blogs_1', to: 'users#blogs_1', via: 'get'
  match '/directory_1', to: 'users#directory_1', via: 'get'
  match '/news_1', to: 'users#news_1', via: 'get'
  match '/services_1', to: 'users#services_1', via: 'get'

  match '/create_account', to: 'users#services_1', via: 'get'


  # get "users/style-demo"
  # get "users/3-columns"
  # get "users/full-width"
  # get "users/gallery"
  # get "users/portfolio"






  
  # map.root :controller => 'images', :action => 'index'

  # # Install the default routes as the lowest priority.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'




  
  
  #match ':controller(/:action(/:id(.:format)))'
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
