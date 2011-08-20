SimplePlan::Application.routes.draw do  
    devise_for :users, :controllers => { :registrations => "registrations" }
		
		resources :activities
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
