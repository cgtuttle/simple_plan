SimplePlan::Application.routes.draw do  
    devise_for :users
		
		resources :activities
		resources :roles
		resources :user_roles
		resources :accounts
		resources :groups
		resources :profiles
		
	namespace :user do
		root :to => 'users#dashboard'
	end

	match '/help',			:to => 'pages#help'
	match '/about',			:to => 'pages#about'
	match '/contact',		:to => 'pages#contact'
	match '/user',			:to => 'users#show'
	
	root :to => 'pages#home'

  
end
