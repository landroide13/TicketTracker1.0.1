Rails.application.routes.draw do
  
  root 'pages#home'

  get 'about' => 'pages#about'

  get '/signup' => 'users#new'
  resources :users, except: [:new]

  resources :tickets

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


end
