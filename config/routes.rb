Greendrive::Application.routes.draw do  
  
  # root :to => 'dashboards#index', :user_name => 'test' # moet nog variable gemaakt worden. En zonder current_user werkt de root niet :/
  
  root :to => 'application#root'
    
  get 'users/:user_name/dashboard' => 'dashboards#index', :as => 'user_name_dashboard'
  get 'users/:user_name/badges' => 'badges#index', :as => 'user_name_badges'
  get 'users/:user_name/leaderboard' => 'leaderboards#index', :as => 'user_name_leaderboard'
  get 'users/:user_name' => 'users#show', :as => 'user_name'

  resources :pictures, :only => [:index, :create, :destroy]

  resources :authentications

  resources :password_resets
  
  match "/search_results/" => "application#search_results", :via => :get, :as =>"search_results"

    # match '/auth/:provider/callback', to: 'sessions#create_facebook'
    # # match '/auth/facebook_session', to: 'sessions#create_facebook_session'
    # match 'auth/failure', to: redirect('/')

  resources :cars

  resources :users do
    resources :segments
  end
  
  resources :users do 
    resources :badges
  end
  
  resources :users
  
  resources :users do
    resources :dashboards
  end

  resources :users do
    resources :cars
  end
  
  resources :cars do
    resources :segments 
  end
  
  resources :traces
  resources :pages

  resources :badges

  resources :leaderboards

  match 'faq' => 'pages#faq', :as => 'faq', :via => :get
  
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  
  resources :sessions
  controller :sessions do
    get "login" => "sessions#new" 
    post "login" => "sessions#create"
    delete "logout" => "sessions#destroy"
end

   match "*path" => redirect("/") #Wrongly typed URL returns to root_path, keep it at the bottom of all the routes.
   
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
