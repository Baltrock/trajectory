Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  root to: "pages#home"
  devise_for :admins, controllers: {registrations: "admins/registrations"}
  devise_for :users, controllers: {registrations: "users/registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "sessions#create"
  post "/login", to: "sessions#create"
  # get 'admin' => 'admin#primary', as: :admin_root
  get 'users' => 'users#primary', as: :user_root
  get 'admins' => 'admin#primary', as: :admin_root
  # Defines the root path route ("/")
  # root "articles#index"
end
