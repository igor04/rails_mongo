TestMongo::Application.routes.draw do
	match '/auth/:provider/callback' => 'authentications#create'
	resources :authentications, only: [:index, :destroy]
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root :to => 'index#index'
end
