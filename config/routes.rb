Rails.application.routes.draw do
  
  
  resources :artifacts
  get 'home/index'
  root :to => "home#index"
  
  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do   
    match 'user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  
  
  devise_for :users, :controllers => { 
    :registrations => "milia/registrations",
    :confirmations => "confirmations",
    :sessions => "milia/sessions", 
    :passwords => "milia/passwords", 
  }
  
  
  resources :tenants do 
    resources :projects
  end  
  resources :members
end
