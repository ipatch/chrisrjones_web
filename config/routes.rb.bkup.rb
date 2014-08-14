CrjCom::Application.routes.draw do

  # the below routes were added when generating the Sections / Pages controllers
  # get "sections/index"
  # get "sections/show"
  # get "sections/new"
  # get "sections/edit"
  # get "sections/delete"
  # get "pages/index"
  # get "pages/show"
  # get "pages/new"
  # get "pages/edit"
  # get "pages/delete"

  # the below routes were added when generating the subjects controller
  # get "subjects/index"
  # get "subjects/show"
  # get "subjects/new"
  # get "subjects/edit"
  # get "subjects/delete"

  root :to => 'home#index'

  # may need to add the following route for the CMS to function properly
  # match ':controller(/:action(/:id))', :via => [:get, :post]

#  get "resume/index"

#  get "demo/index"

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
   
  # the below route will work in rails v3 but in v4
  # match ':controller(/:action(/:id))(.:format)'

  match ':controller(/:action(/:id))', :via => [:get, :post]
end
