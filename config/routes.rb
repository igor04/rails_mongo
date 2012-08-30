TestMongo::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}

	match '/auth/:provider/callback' => 'authentications#create'
	resources :authentications, only: [:index, :destroy]


  resources :users, only: [:index, :show] do
  	get '/information/edit' => 'user_informations#edit'
  	put '/information' => 'user_informations#update'
  end
  
  root :to => 'index#index'
end
