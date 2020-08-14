Rails.application.routes.draw do

  # Static Page
  root to: 'static_pages#index'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/secret'


  # Devise for user
  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  devise_for :users
  # Change the default of route for login, signup
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'login', to: 'devise/sessions#new'
    post'login', to: 'devise/sessions#create'
    get 'signup', to: 'devise/registrations#new'
    post'signup', to: 'devise/registrations#create'
  end
  
  # Account settings
  get 'accountsettings/info', to: 'users#info'
  patch 'accountsettings/info', to: 'users#profile'
  get 'accountsettings/creditcard', to: 'users#credit_card'
  get 'accountsettings/secret', to: 'users#secret'
  

  resources :events do
    resources :attendances, only: [:index, :new, :create]
  end
 
end
