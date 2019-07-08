Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "users#home"
  get "/users/login", to: 'sessions#user_new'
  post '/users/login', to: 'sessions#user_create'
  delete '/users/logout', to: 'sessions#user_destroy'
  get "/restaurants/login", to: 'sessions#restaurant_new'
  post '/restaurants/login', to: 'sessions#restaurant_create'
  delete '/restaurants/logout', to: 'sessions#restaurant_destroy'
  resources :users, only: [:show, :new, :create, :destroy, :edit, :update]
  resources :restaurants
  # resources :drivers, only: [:show, :new, :create, :destroy, :edit, :update]
end
