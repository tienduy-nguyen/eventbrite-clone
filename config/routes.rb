Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root to: 'static_pages#index'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/secret'

  resources :events 
  

  # Account settings
  get 'accountsettings/accountsettings', to: 'users#contact_info'
  get 'accountsettings/creditcard', to: 'users#credit_card'
  get 'accountsettings/usersecret', to: 'users#user_secret'
end
