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
  
  get '/users_funko_pop' => 'funko_pop#users_funko_pop', :as => "users_funko_pop"
  get '/all_funko_pops', to: "funko_pops#all_funko_pops"

  get '/auth/:provider/callback', to: 'user_sessions#create'
end
