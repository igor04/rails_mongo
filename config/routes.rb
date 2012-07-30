TestMongo::Application.routes.draw do
	match '/auth/:provider/callback' => 'authentications#create'
	resources :authentications, only: [:index, :destroy]
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :user, only: [:index, :show]

  root :to => 'index#index'
end
