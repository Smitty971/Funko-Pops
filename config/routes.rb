Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'funko_pops#welcome'

  resources :users do 
    resources :funko_pops
  end


  resources :funko_pops do 
    resources :comments
  end 
  resources :tags
  
  #test

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  get '/logout', to: 'user_sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
end
