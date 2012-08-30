TestMongo::Application.routes.draw do
  resources :testssses

	match '/auth/:provider/callback' => 'authentications#create'
	resources :authentications, only: [:index, :destroy]
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :users, only: [:index, :show] do
  	get '/information/edit' => 'user_informations#edit'
  	put '/information' => 'user_informations#update'
  end
  root :to => 'index#index'
end
