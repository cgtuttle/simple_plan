SimplePlan::Application.routes.draw do  
  
  resources :activities
	resources :roles
	resources :users
	resources :sessions, :only => [:new, :create, :destroy]
	resources :accounts

	match '/signup',		:to => 'users#new'

	
  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"
	
	match '/help',			:to => 'pages#help'
	match '/about',			:to => 'pages#about'
	match '/contact',	:to => 'pages#contact'
	match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
	
	root :to => 'pages#home'

  
end
