# frozen_string_literal: true

require 'addressable/uri'
require 'api_constraints'
# priority based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end

  poop = 'https://linkedin.com/in/💩'
  get 'resume', to: redirect { |_params, _req| Addressable::URI.parse(URI.escape(poop)) }
  # Add below route for correct "resumé" spelling
  get 'resumé', to: redirect { |_params, _req| Addressable::URI.parse(URI.escape(poop)) }
  dots = 'https://github.com/ipatch/dotfiles'
  get 'dotfiles', to: redirect { |_params, _req| Addressable::URI.parse(URI.escape(dots)) }

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  # the below route led to a rails routing error
  # get 'confirm' => 'users/:confirmation_token#confirm'

  resources :users do
    get 'foo' => 'users#foo'
  end
  resources :sessions
  resources :password_resets
  resources :confirmations

  resources :attachments do
    member do
      get :download
      get :view
    end
  end
  # GET /attachments/view/42 #legacy
  get '/attachments/view/:id', to: 'attachments#view'
  get 'about' => 'about#index'
  get 'contact' => 'contact#contact'

  # Api definitions
  namespace :api, defaults: { format: 'json' } do
    # scope module: :v1, constraints: ApiConstraints.new(version: 1) do
    match 'hello', to: 'articles#hello', via: [:get]
    get 'hell0' => 'articles#hello'
    get 'empty' => 'articles#empty'

    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'
    post 'logout', to: 'authentication#logout'

    # list our resources here
    resources :articles # WORKS

    # NOTE: to limit what resources can be reached
    # EX
    # resources :articles, :except => [:new, :edit]
    # end
  end
  # You can have the root of your site routed with "root"
  root to: 'articles#index', defaults: { format: 'html' }
end
