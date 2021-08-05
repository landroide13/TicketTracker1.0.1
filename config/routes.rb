Rails.application.routes.draw do
  
  root 'pages#home'

  get 'about' => 'pages#about'

  get '/signup' => 'users#new'
  resources :users, except: [:new]

  get '/admin_signup' => 'admins#new'
  resources :admins, except: [:new] 
  get 'signin' => 'sessions#signin' 
  post 'signin' => 'sessions#signin_admin'
  delete 'signout' => 'sessions#signout_admin'


  resources :tickets

  get 'login' => 'sessions#new' 
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


end
