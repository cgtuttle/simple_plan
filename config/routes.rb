SimplePlan::Application.routes.draw do  

  devise_for :users, :controllers => { :registrations => "registrations" }
		
  resources :activities
	resources :accounts
	resources :services
	resources :profiles
	resources :partnerships
	resources	:categories
	resources	:products
  resources :program_categories
  resources :program_products
  resources :program_activities
		
	resources	:programs do
		resources	:deals	
	end
    
  
		
	namespace :user do
		root :to => 'users#dashboard'
	end

	match '/help',			:to => 'pages#help'
	match '/about',			:to => 'pages#about'
	match '/contact',		:to => 'pages#contact'
	match '/user',			:to => 'users#show'
	match '/users',			:to => 'users#index'
	
	root :to => 'pages#home'

  
end
