Rails.application.routes.draw do
root to: 'homes#top'
devise_for :users
get "home/about" => "homes#about", as: "about"

resources :books
resources :users, only: [:edit, :index, :create, :show, :destroy]
 patch 'users/:id' => 'users#update', as: 'update_user'
end