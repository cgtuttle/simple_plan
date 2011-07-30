SimplePlan::Application.routes.draw do  
    devise_for :users
		
		resources :activities
		resources :roles
		resources :accounts
		resources :services
		resources :profiles
		resources :partnerships
		
	namespace :user do
		root :to => 'users#dashboard'
	end

	match '/help',			:to => 'pages#help'
	match '/about',			:to => 'pages#about'
	match '/contact',		:to => 'pages#contact'
	match '/user',			:to => 'users#show'
	
	root :to => 'pages#home'

  
end
