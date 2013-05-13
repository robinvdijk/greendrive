Greendrive::Application.routes.draw do  

  get "cars/new"

  resources :pictures, :only => [:index, :create, :destroy]

  resources :authentications

  resources :password_resets

    match '/auth/:provider/callback', to: 'sessions#create_facebook'
    # match '/auth/facebook_session', to: 'sessions#create_facebook_session'
    match 'auth/failure', to: redirect('/')
      
    match 'signout', to: 'sessions#destroy', as: 'signout'
    match 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :cars

  resources :users do
    resources :segments
  end
  
  resources :badges do 
    resources :users
  end

  resources :users do
    resources :cars
  end
  
  resources :traces
  
  resources :pages

  root :to => "pages#dashboard"
  
  controller :sessions do
    get "login" => "sessions#new"
    post "login" => "sessions#create"
    delete "logout" => "sessions#destroy"

    
end
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
