SimplePlan::Application.routes.draw do  
    devise_for :users
		
		resources :activities
		resources :roles
		resources :user_roles
		resources :accounts
		resources :groups
		
	namespace :user do
		root :to => 'users#dashboard'
	end

  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"
	
	match '/help',			:to => 'pages#help'
	match '/about',			:to => 'pages#about'
	match '/contact',		:to => 'pages#contact'
	match '/user',			:to => 'users#show'
	
	root :to => 'pages#home'

  
end
