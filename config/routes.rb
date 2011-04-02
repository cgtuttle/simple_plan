SimplePlan::Application.routes.draw do

  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"
	
	match '/help',			:to => 'pages#help'
	match '/about',			:to => 'pages#about'
	match '/contact',	:to => 'pages#contact'
	
	root :to => 'pages#home'

  
end
