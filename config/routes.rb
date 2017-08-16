Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'home/index'
  post "toggle_like" => "likes#toggle"
  root "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
