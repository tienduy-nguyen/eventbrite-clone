Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'login', to: 'devise/sessions#new'
    post'login', to: 'devise/sessions#create'
    get 'signup', to: 'devise/registrations#new'
    post'signup', to: 'devise/registrations#create'
  end
  
  root to: 'static_pages#index'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/secret'

  resources :events 
  

  # Account settings
  get 'accountsettings/info', to: 'users#info'
  patch 'accountsettings/info', to: 'users#profile'
  get 'accountsettings/creditcard', to: 'users#credit_card'
  get 'accountsettings/secret', to: 'users#secret'
end
