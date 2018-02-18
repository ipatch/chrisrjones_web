Rails.application.routes.draw do
  
    resources :articles do
    resources :comments
  end

  get 'resume' => 'resume#index'

  get 'signup' => 'users#new'
  get 'login' =>'sessions#new'
  get 'logout' => 'sessions#destroy'

  # the below route led to a rails routing error
  # get 'confirm' => 'users/:confirmation_token#confirm'

  resources :users
  resources :sessions
  resources :password_resets
  resources :confirmations

  # removed "resources :attachments" out of :articles do loop due to routing error
  resources :attachments

  # route to hopefully get confirmation link working :-/
  # match '/users/:confirmation_token', :to => 'users#confirm', via: [:post, :get]

  # test route
  match 'users/foo', :to => 'users#foo', via: [:post, :get]

  # Added below route for correct "resumé" spelling
  get 'resumé', :to =>"resume#index"

  # get 'about#index'
  get 'about' => 'about#index'
  get 'contact' => 'contact#contact'

  resources :about
  resources :contact
  
  match ':controller(/:action(/:id))(.:format)', via: [:post, :get]
  # match ':controller(/:action(/:id))', :via => [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Api definitions
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1 do
      # list our resources here
    end
  end

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root "articles#index"
end