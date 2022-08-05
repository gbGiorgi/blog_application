# frozen_string_literal: true

Rails.application.routes.draw do
  resources :mobiles
  get 'members/dashboard'
  resources :categories
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    authenticated :user, ->(user) { user.admin? } do
      get 'admin', to: 'admin#index'
      get 'admin/posts'
      get 'admin/comments'
      get 'admin/users'
      get 'admin/show_post/:id', to: 'admin#show_post', as: 'admin_post'

      get 'admin/user/:id', to: 'admin#show_user', as: 'admin_user'
      get 'admin/destroy/:id' => 'admin#destroy', :via => :delete, :as => :admin_destroy_user
      post '/create_admin/:id', to: 'users#create_admin', as: :user_become_admin
      post '/cancel_admin/:id', to: 'users#cancel_admin', as: :admin_become_user

      post '/approve_post/:user_id/:id', to: 'posts#approve_post', as: :approve_post
      post '/un_approve_post/:user_id/:id', to: 'posts#un_approve_post', as: :un_approve_post
    end

    get 'checkout', to: 'checkouts#show'
    get 'checkout/success', to: 'checkouts#success'
    get 'billing', to: 'billing#show'

    get 'search', to: 'search#index'
    get 'users/profile'


    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

    get '/u/:id', to: 'users#profile', as: 'user'

    resources :posts do
      resources :comments
      resources :likes
    end

    get 'about', to: 'pages#about'

    root 'pages#home'
    delete 'users/delete/:id', to: 'destroy_users#destroy'
  end
  get "users/locations/add", to: "locations#new", as: :add_location
  post "users/locations/add", to: "locations#create", as: :create_location
  get "/users/:user_id/locations/all", to: "locations#index", as: :locations
  get "/users/locations/show/:id", to: "locations#show", as: :show_location
  get 'users/:user_id/locations/delete/:id', to: 'locations#destroy', via: :delete, as: :destroy_address

  get 'users/mobile_phone', to: 'mobiles#new'
  post 'users/mobile_phone', to: 'mobiles#create'
  get 'users/:user_id/mobile_phone/delete/:id', to: 'mobiles#destroy', via: :delete, as: :destroy_mobile
end
