Rails.application.routes.draw do
  
  get 'signup' => 'users#new'
  get 'login' =>'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :users
  resources :sessions


  # get 'sessions/new'

  # resources :users

  # get 'contact/index'

  # get 'about/index'

  # Don't need auto-generated routes
  # I'm using the default route.
  # get 'admin_users/index'
  # get 'admin_users/new'
  # get 'admin_users/edit'
  # get 'admin_users/delete'
  # get 'access/index'
  # get 'blah/index'
  # get 'public/index'
  # get 'public/show'

  root "public#index"

  get 'show/:permalink', :to => 'public#show'
  get 'admin', :to => "access#index"
  # Added below route for correct "resumé" spelling
  get 'resumé', :to =>"resume#index"

  # get 'about#index'
  get 'about' => 'about#index'
  get 'contact' => 'contact#contact'

  
  resources :subjects
  resources :pages
  resources :sections
  resources :admin_users
  resources :access
  resources :about
  resources :contact
  get 'logout' => 'access#logout'
  post 'login' => 'access#attempt_login'

  match ':controller(/:action(/:id))(.:format)', via: [:post, :get]
  # match ':controller(/:action(/:id))', :via => [:get, :post]

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
