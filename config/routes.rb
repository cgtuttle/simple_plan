SimplePlan::Application.routes.draw do  

  devise_for :users, :controllers => { :registrations => "registrations" }
		
  match 'programs/grid_data', :to => 'programs#grid_data'
	match 'programs/list', :to => 'programs#list'
	match 'programs/filter', :to => 'programs#filter'
	
	resources :activities
	resources	:accounts	
	resources :services
	resources :profiles
	resources :partnerships
	resources	:categories
	resources	:products
  resources :program_categories
  resources :program_products
  resources :program_activities
	resources :imports
	resources :worksheets
	
	resources :budgets do
		resources :plans
	end
	
	resources	:plans do
		member do
			get 'worksheet'
			get 'test'
		end
		resources	:programs do
			member do
				get 'copy'
			end
		end
	end

	resources	:programs do
		member do
			get 'copy'
		end
		resources	:deals	
	end
	
	resources :deals do
		resources :deal_products
	end
		
	resources :deal_products do
		resources :deal_activities
	end
	
	namespace :user do
		root :to => 'users#dashboard'
	end
	
	match 'users' => 'users#dashboard', :as => 'user_root'

	match '/help',			:to => 'pages#help'
	match '/about',			:to => 'pages#about'
	match '/contact',		:to => 'pages#contact'
	match '/user',			:to => 'users#show'
	match '/users',			:to => 'users#index'
	
	root :to => 'pages#home'

  
end
