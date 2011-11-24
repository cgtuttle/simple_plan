SimplePlan::Application.routes.draw do  

  devise_for :users, :controllers => { :registrations => "registrations" }
		
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
	
	resources	:plans do
		resources	:programs
	end

	resources	:programs do
		resources	:deals	
	end
	
	resources :deals do
		resources :deal_products
	end
		
	resources :deal_products do
		resources :deal_activities
	end
	
	resources :import_maps do
		member do
			get 'select'
			put 'complete'
		end
		resources :import_map_columns do
		end	
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
	match '/products/import',		:to => 'products#csv_import', :as => 'product_csv_import'
	
	root :to => 'pages#home'

  
end
